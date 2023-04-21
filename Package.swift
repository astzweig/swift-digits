// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "swift-digits",
    products: [
        .library(
            name: "Digits",
            targets: ["Digits"])
    ],
    targets: [
        .target(
            name: "Digits",
            dependencies: []),
        .testTarget(
            name: "DigitsUnitTests",
            dependencies: ["Digits"])
    ]
)
