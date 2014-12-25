public typealias Bitmask = UInt64

public extension Bitmask {

    var empty: Bool {
        return self == 0
    }

    var any: Bool {
        return self != 0
    }

    // Returns number of bits set.
    var count: Int {
        var mask = self
        mask -= (mask >> 1) & 0x5555555555555555
        mask = ((mask >> 2) & 0x3333333333333333) + (mask & 0x3333333333333333)
        mask = ((mask >> 4) + mask) & 0x0F0F0F0F0F0F0F0F
        return Int((mask * 0x0101010101010101) >> 56)
    }

    // Eugene Nalimov's bitScanReverse: finds most significant bit set (MSB):
    var last: Int {
        var mask = self, offset = 0

        if mask > 0xFFFFFFFF {
            mask >>= 32
            offset = 32
        }

        if mask > 0xFFFF {
            mask >>= 16
            offset += 16
        }

        if mask > 0xFF {
            mask >>= 8
            offset += 8
        }

        return offset + msbLookup[Int(mask)]
    }

    func on(offset: Int) -> Bool {
        return (self & Bitmask(1 << offset)) != 0
    }

    func off(offset: Int) -> Bool {
        return !self.on(offset)
    }
}
