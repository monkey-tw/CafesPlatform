// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Integration",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Integration",
            targets: ["Integration"]),
    ],
    dependencies: [
        .package(path: "../NetworkTool"),
        .package(path: "../Common"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.6.0")),
        .package(url: "https://github.com/relatedcode/ProgressHUD.git", .upToNextMajor(from: "14.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Integration",
            dependencies: ["NetworkTool", "Common", "SnapKit", "RxSwift", .product(name: "RxCocoa", package: "RxSwift"), "ProgressHUD", .product(name: "RxBlocking", package: "RxSwift")]),
        .testTarget(
            name: "IntegrationTests",
            dependencies: ["Integration"]),
    ]
)
