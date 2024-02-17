// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ios-weather-ui",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ios-weather-ui",
            targets: ["ios-weather-ui"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ios-weather-ui",
            dependencies: []),
        .testTarget(
            name: "ios-weather-uiTests",
            dependencies: ["ios-weather-ui"]),
    ]
)
