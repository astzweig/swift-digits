# Swift Digits

Swift Digits extends Swift's builtin integer types with useful methods that work on individual digits.

## Usage
Digits are always relativ to a [base] of a [positional system]. All methods therefor
take a `usingBase` parameter, which defaults to the base 10 i.e. the decimal system.

[base]: https://en.wikipedia.org/wiki/Radix
[positional system]: https://en.wikipedia.org/wiki/Positional_notation#Mathematics

<details>
<summary>Table of contents</summary>
    
- [Digits amount](#digits-amount)
- [Digits sum](#digits-sum)
- [Digits reversion](#digits-reversion)
- [Digits replacement](#digits-replacement)
- [Digits iterator](#digits-iterator)
- [Digits array](#digits-array)
- [Highest positional factor](#highest-positional-factor)
- [Digits iterator](#digits-iterator)

</details>

### Digits amount
Counts the digits of the number.

```swift
let _ = 2014.countDigits() // returns 4
let _ = 2014.countDigits(usingBase: 16) // returns 3, as 2014 = 0x7de
```

### Digits sum
Calculats the sum of the digits.

```swift
let _ = 2014.sumDigits() // returns 7, as 7 = 2 + 0 + 1 + 4
let _ = 0x7de.sumDigits(usingBase: 16) // returns 34 or 0x22, as 0x22 = 0x7 + 0xd + 0xe
```

### Digits reversion
Reverses the digit order.

```swift
let _ = 2014.revertDigits() // returns 4102
let _ = 0x7de.revertDigits(usingBase: 16) // returns 3799 or 0xed7
```

### Digits replacement
Replaces all occurences of a digit with another digit.
```swift
var counter = 1010
counter.replaceDigit(0, with: 1)
// counter == 1111

var hexCounter = 0xf0
hexCounter.replaceDigit(0xf, with: 0xc, usingBase: 16)
// counter == 0xc0 or 192
```

Alternatively there is a non mutating method:

```swift
var counter = 1010.replacingDigit(0, with: 1)
// counter == 1111
```

### Digits iterator
Returns an iterator that goes over digits.

```swift
for digit in 2014.digits() {
    print(digit)
}
// prints
// 2
// 0
// 1
// 4

for digit in 0x7de.digits(usingBase: 16) {
    print(digit)
}
// prints
// 7
// 13 or 0xd
// 14 or 0xe
```

### Digits array
Returns an array containing the digits of the number with the most significant
digit at the beginning.

```swift
let _ = 2014.asDigits() // returns [2, 0, 1, 4]
let _ = 0xfde.asDigits(usingBase: 16) // returns [15 or 0xf, 13 or 0xd, 14 or 0xe]
```

### Highest positional factor
Returns the highest positional factor included in the number, i.e. the factor of
the most significant digit.

```swift
let _ = 12.highestPositionalFactor() // returns 10, as 12 = 1 * 10 + 2 * 1
let _ = 933.highestPositionalFactor()) // returns 100, as 933 = 9 * 100 + 3 * 10 + 3 * 1

let _ = 0xc.highestPositionalFactor(usingBase: 16)) // returns 1, as 0xc = 12 * 1
let _ = 0x5d.highestPositionalFactor(usingBase: 16)) // returns 16, as 0x5d = 5 * 16 + 13 * 1
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
