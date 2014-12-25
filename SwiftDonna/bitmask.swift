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

    func on(offset: Int) -> Bool {
        return (self & Bitmask(1 << offset)) != 0
    }

    func off(offset: Int) -> Bool {
        return !self.on(offset)
    }
}
