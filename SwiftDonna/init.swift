var msbLookup: [Int] = []

public func initialize() {
    func initArrays() {
        println("initArrays")
        // Most significant bit lookup table.
        for i in 0..<msbLookup.count {
            if i > 127 {
                msbLookup[i] = 7
            } else if i > 63 {
                msbLookup[i] = 6
            } else if i > 31 {
                msbLookup[i] = 5
            } else if i > 15 {
                msbLookup[i] = 4
            } else if i > 7 {
                msbLookup[i] = 3
            } else if i > 3 {
                msbLookup[i] = 2
            } else if i > 1 {
                msbLookup[i] = 1
            }
        }
    }

    initArrays()
}
