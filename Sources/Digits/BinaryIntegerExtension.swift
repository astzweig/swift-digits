extension BinaryInteger {
    public func countDigits(usingBase base: Self = 10) -> Self {
        var quotient = self
        var exponent: Self = 0

        while quotient >= 1 {
            quotient /= base
            exponent += 1
        }
        return exponent
    }

    public func digits(usingBase base: Self = 10) -> DigitIterator<Self> {
        return DigitIterator(self, usingBase: base)
    }

    public func asDigits(usingBase base: Self = 10) -> [Self] {
        var digits: [Self] = []
        for digit in self.digits(usingBase: base) {
            digits.append(digit)
        }
        return digits
    }

    public func highestPositionalFactor(usingBase base: Self = 10) -> Self {
        var positionalFactor: Self = 1
        var counter = self.countDigits(usingBase: base) - 1
        while counter > 0 {
            positionalFactor *= base
            counter -= 1
        }
        return positionalFactor
    }

    public mutating func replaceDigit(_ currentDigit: Self, with newDigit: Self, usingBase base: Self = 10) {
        self = self.replacingDigit(currentDigit, with: newDigit, usingBase: base)
    }

    public func replacingDigit(_ currentDigit: Self, with newDigit: Self, usingBase base: Self = 10) -> Self {
        var num: Self = 0
        var positionalValue: Self = self.highestPositionalFactor(usingBase: base)

        for var digit in self.digits(usingBase: base) {
            if digit == currentDigit {
                digit = newDigit
            }
            num += digit * positionalValue
            positionalValue /= base
        }
        return num
    }
}
