public typealias Bitmask = UInt64

public extension Bitmask {
    var empty: Bool { return self == 0 }
    var any: Bool { return self != 0 }

    func on(offset: Int) -> Bool {
        return (self & Bitmask(1 << offset)) != 0
    }

    func off(offset: Int) -> Bool {
        return !self.on(offset)
    }
}
