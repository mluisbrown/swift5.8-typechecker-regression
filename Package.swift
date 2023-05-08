// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift5.8-typechecker-regression",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v15)
    ],
    products: [
        .library(
            name: "swift5.8-typechecker-regression",
            targets: ["swift5.8-typechecker-regression"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.52.0")),
    ],
    targets: [
        .target(
            name: "swift5.8-typechecker-regression",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                ),
            ]
        )
    ]
)
