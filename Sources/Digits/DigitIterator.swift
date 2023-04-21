struct DigitIterator<T: BinaryInteger>: IteratorProtocol, Sequence {
    var number: T
    let base: T
    var divisor: T

    init(_ number: T, usingBase base: T = 10) {
        self.number = number
        self.base = base
        self.divisor = 1
        self.adaptDivisorToDigitsCount()
    }

    func makeIterator() -> Self {
        return self
    }

    mutating func adaptDivisorToDigitsCount() {
        var counter: T = self.number.countDigits(usingBase: self.base) - 1
        while counter > 0 {
            self.divisor *= self.base
            counter -= 1
        }
    }

    mutating func next() -> T? {
        guard self.divisor > 0 else { return nil }
        let digit = self.number / self.divisor
        self.number = self.number % self.divisor
        self.divisor /= self.base
        return digit
    }
}
