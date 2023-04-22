public struct DigitIterator<T: BinaryInteger>: IteratorProtocol, Sequence {
    var number: T
    let base: T
    var divisor: T

    init(_ number: T, usingBase base: T = 10) {
        self.number = number
        self.base = base
        self.divisor = self.number.highestPositionalFactor(usingBase: base)
    }

    public func makeIterator() -> Self {
        return self
    }

    mutating public func next() -> T? {
        guard self.divisor > 0 else { return nil }
        let digit = self.number / self.divisor
        self.number = self.number % self.divisor
        self.divisor /= self.base
        return digit
    }
}
