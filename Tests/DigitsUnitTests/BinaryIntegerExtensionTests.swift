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

final class BinaryIntegerExtension_SumDigitsTests: XCTestCase {
    func testSumsDigitsForSingleDigitDecimal() {
        let number = 8
        XCTAssertEqual(number.sumDigits(), 8)
    }
    
    func testSumsDigitsForQuadrupelDigitDecimal() {
        let number = 2014
        XCTAssertEqual(number.sumDigits(), (2 + 0 + 1 + 4))
    }
    
    func testSumsDigitsForSingleDigitHexadecimal() {
        let number = 0xd
        XCTAssertEqual(number.sumDigits(usingBase: 16), 0xd)
    }
    
    func testSumsDigitsForQuadrupelDigitHexadecimal() {
        let number = 0xf0d9
        XCTAssertEqual(number.sumDigits(usingBase: 16), (0xf + 0x0 + 0xd + 0x9))
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

final class BinaryIntegerExtension_AsDigitsTests: XCTestCase {
    func testReturnsDigitsForSingleDigitDecimal() throws {
        XCTAssertEqual(8.asDigits(), [8])
    }

    func testReturnsDigitsForTrippleDigitDecimal() throws {
        XCTAssertEqual(158.asDigits(), [1, 5, 8])
    }

    func testReturnsDigitsForSingleDigitHexadecimal() throws {
        XCTAssertEqual(0xd.asDigits(usingBase: 16), [0xd])
    }

    func testReturnsDigitsForTrippleDigitHexadecimal() throws {
        XCTAssertEqual(0x7de.asDigits(usingBase: 16), [0x7, 0xd, 0xe])
    }
}

final class BinaryIntegerExtension_HighestPositionalFactorTests: XCTestCase {
    func testReturnsFactorForSingleDigitDecimal() {
        let number = 8
        XCTAssertEqual(number.highestPositionalFactor(), 1)
    }

    func testReturnsFactorForDoubleDigitDecimal() {
        let number = 93
        XCTAssertEqual(number.highestPositionalFactor(), 10)
    }

    func testReturnsFactorForSingleDigitHexadecimal() {
        let number = 0xc
        XCTAssertEqual(number.highestPositionalFactor(usingBase: 16), 1)
    }

    func testReturnsFactorForDoubleDigitHexadecimal() {
        let number = 0x5d
        XCTAssertEqual(number.highestPositionalFactor(usingBase: 16), 16)
    }
}

final class BinaryIntegerExtension_ReplacingDigitsTests: XCTestCase {
    func testReplacesDigitOfSingleDigitDecimal() throws {
        let num = 8.replacingDigit(8, with: 7)
        XCTAssertEqual(num, 7)
    }

    func testReplacesDigitOfTrippleDigitDecimal() throws {
        let num = 158.replacingDigit(5, with: 9)
        XCTAssertEqual(num, 198)
    }

    func testReplacesDigitOfSingleDigitHexadecimal() throws {
        let num = 0xc.replacingDigit(0xc, with: 0xf, usingBase: 16)
        XCTAssertEqual(num, 0xf)
    }

    func testReplacesDigitOfTrippleDigitHexadecimal() throws {
        let num = 0x7DE.replacingDigit(0x7, with: 0xF, usingBase: 16)
        XCTAssertEqual(num, 0xFDE)
    }
}
