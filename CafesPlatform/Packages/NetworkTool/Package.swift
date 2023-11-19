// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkTool",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkTool",
            targets: ["NetworkTool"]),
    ],
    dependencies: [.package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.6.0"))],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkTool",
            dependencies: ["RxSwift"], 
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NetworkToolTests",
            dependencies: ["NetworkTool"]),
    ]
)
