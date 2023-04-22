# Swift Digits

Swift Digits extends Swift's builtin integer types with useful methods that work on individual digits.

## Usage
Digits are always relativ to a [base] of a [positional system]. All methods therefor
take a `usingBase` parameter, which defaults to the base 10 i.e. the decimal system.

[base]: https://en.wikipedia.org/wiki/Radix
[positional system]: https://en.wikipedia.org/wiki/Positional_notation#Mathematics

### Digits amount
```swift
let number = 2014
print(number.countDigits())
// prints 4
print(number.countDigits(usingBase: 16))
// prints 3 (as 2014 = 0x7DE)
```

### Digits sum
```swift
let number = 2014
print(number.sumDigits())
// prints 7 (as 7 = 2 + 0 + 1 + 4)
print(number.sumDigits(usingBase: 16))
// prints 34 (as 34 = 0x22 = 0x7 + 0xD + 0xE)
```

### Digits Reversion
```swift
let number = 2014
print(number.revertDigits())
// prints 4102
print(number.revertDigits(usingBase: 16))
// prints 3799 (as 3799 = 0xED7 and 2014 = 0x7DE)
```

### Digits iterator
```swift
let number = 2014

for digit in number.digits() {
    print(digit)
}
// prints 2 0 1 4
for digit in number.digits(usingBase: 16) {
    print(digit)
}
// prints 7 D E
```

### Digits array
```swift
var digits = 2014.asDigits()
// digits == [2, 0, 1, 4]
digits = 0xfde.asDigits(usingBase: 16)
// digits == [0xf, 0xd, 0xe]
```

### Highest positional factor
```swift
print(12.highestPositionalFactor()) // 12 = 1 * 10 + 2 * 1
// prints 10

print(933.highestPositionalFactor()) // 933 = 9 * 100 + 3 * 10 + 3 * 1
// prints 100

print(0xc.highestPositionalFactor(usingBase: 16)) // 0xc = 12 * 1
// prints 1

print(0x5d.highestPositionalFactor(usingBase: 16)) // 0x5d = 5 * 16 + 13 * 1
// prints 16
```

### Replace Digits
```swift
var counter = 1010
// later in code
counter.replaceDigit(0, with: 1)
// counter == 1111

var hexCounter = 0xf0
// later in code
hexCounter.replaceDigit(0xf, with: 0xc, usingBase: 16)
// counter == 192 or 0xc0
```

Alternatively there is a non mutating method:

```swift
var counter = 1010.replacingDigit(0, with: 1)
// counter == 1111
```

## Adding `Digits` as a Dependency

To use the `Digits` library in a SwiftPM project, 
add it to the dependencies for your package and your command-line executable target:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/astzweig/swift-digits", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(name: "<command-line-tool>", dependencies: [
            // other dependencies
            .product(name: "Digits", package: "swift-digits"),
        ]),
        // other targets
    ]
)
```

### Supported Versions

The most recent versions of swift-digits supports Swift 5.5 and newer. The minimum Swift version supported by swift-digits releases are detailed below:

swift-digits          | Minimum Swift Version
----------------------|----------------------
`0.0.1 ...`           | 5.5
