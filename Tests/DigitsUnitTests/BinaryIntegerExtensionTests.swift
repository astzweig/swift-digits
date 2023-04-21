import XCTest
@testable import Digits

final class BinaryIntegerExtension_CountDigitsTests: XCTestCase {
    func testCountsDigitsForSingleDigitDecimal() {
        let number = 8
        XCTAssertEqual(number.countDigits(), 1)
    }

    func testCountsDigitsForDoubleDigitDecimal() {
        let number = 93
        XCTAssertEqual(number.countDigits(), 2)
    }

    func testCountsDigitsForSingleDigitHexadecimal() {
        let number = 0xf
        XCTAssertEqual(number.countDigits(usingBase: 16), 1)
    }

    func testCountsDigitsForDoubleDigitHexadecimal() {
        let number = 0x5D
        XCTAssertEqual(number.countDigits(usingBase: 16), 2)
    }
}
