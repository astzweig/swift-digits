# Swift Digits

Swift Digits extends Swift's builtin integer types with useful methods that work on individual digits.

## Usage
### Digits amount
```swift
let number = 2014
print(number.countDigits())
// prints 4
```

Or for getting the digits on another base representation:

```swift
let number = 2014
print(number.countDigits(usingBase: 16))
// prints 3 (as 2014 = 0x7DE)
```

### Digits iterator
```swift
let number = 2014

for digit in number.digits() {
    print(digit)
}
// prints 2 0 1 4
```

Or for getting the digits on another base representation:

```swift
let number = 2014

for digit in number.digits(usingBase: 16) {
    print(digit)
}
// prints 7 D E
```

### Highest positional factor
```swift
print(12.highestPositionalFactor()) // 12 = 1 * 10 + 2 * 1
// prints 10

print(933.highestPositionalFactor()) // 933 = 9 * 100 + 3 * 10 + 3 * 1
// prints 100
```

Or for getting the highest positional factor on another base:

```swift
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
```

To replace digits on other base representation e.g. base-16 use:

```swift
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
