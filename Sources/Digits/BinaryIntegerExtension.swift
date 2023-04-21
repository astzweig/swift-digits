extension BinaryInteger {
    func countDigits(usingBase base: Self = 10) -> Self {
        var quotient = self
        var exponent: Self = 0

        while quotient >= 1 {
            quotient /= base
            exponent += 1
        }
        return exponent
    }

    func digits(usingBase base: Self = 10) -> DigitIterator<Self> {
        return DigitIterator(self, usingBase: base)
    }
}
