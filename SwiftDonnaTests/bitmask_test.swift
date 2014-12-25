import Donna
import XCTest

// XCTAssertNotNil asserts a variable is not nil.
// XCTAssertTrue asserts a condition is true.
// XCTAssertFalse asserts a condition is false.
// XCTAssertEqual asserts two values are equal.
// XCTAssertEqualObjects asserts two objects are equal.
// XCTAssertEqualWithAccuracy asserts two floating-point values are equal.

class BitmaskTests: XCTestCase {

    // This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    // This method is called after the invocation of each test method in the class.
    override func tearDown() {
        super.tearDown()
    }

    func testBitmask010() {
        XCTAssertTrue(Bitmask(0).empty)
        XCTAssertFalse(Bitmask(7).empty)
        XCTAssertTrue(Bitmask(9).any)
        XCTAssertFalse(Bitmask(0).any)
    }

    func testBitmask020() {
        XCTAssertEqual(Bitmask(0x00).count, 0)
        XCTAssertEqual(Bitmask(0x0F).count, 4)
        XCTAssertEqual(Bitmask(0xFF).count, 8)
    }
}
