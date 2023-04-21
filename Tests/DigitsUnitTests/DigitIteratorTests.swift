import XCTest
@testable import Digits

final class DigitIteratorTests: XCTestCase {
    func testReturnsDigitForSingleDigitDecimal() throws {
        var iterator = DigitIterator(8)
        XCTAssertEqual(iterator.next(), 8)
    }

    func testReturnsDigitsForDoubleDigitDecimal() throws {
        var iterator = DigitIterator(93)
        XCTAssertEqual(iterator.next(), 9)
        XCTAssertEqual(iterator.next(), 3)
    }

    func testReturnsDigitForSingleDigitHexadecimal() throws {
        var iterator = DigitIterator(0xF, usingBase: 16)
        XCTAssertEqual(iterator.next(), 0xF)
    }

    func testReturnsDigitsForDoubleDigitHexadecimal() throws {
        var iterator = DigitIterator(0x5D, usingBase: 16)
        XCTAssertEqual(iterator.next(), 0x5)
        XCTAssertEqual(iterator.next(), 0xD)
    }
}
