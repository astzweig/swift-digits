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
