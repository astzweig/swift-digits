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

final class BinaryIntegerExtension_DigitsTests: XCTestCase {
    func testReturnsIterator() throws {
        let _: any IteratorProtocol = 10.digits()
    }

    func testIteratesOverDecimalDigits() throws {
        var expectedDigits = [9, 3]
        for digit in 93.digits() {
            XCTAssertEqual(digit, expectedDigits.removeFirst())
        }
    }
    
    func testIteratesOverHexadecimalDigits() throws {
        var expectedDigits = [0x5, 0xd]
        for digit in 0x5d.digits(usingBase: 16) {
            XCTAssertEqual(digit, expectedDigits.removeFirst())
        }
    }
}
