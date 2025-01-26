// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "CollectionBuilders",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "CollectionBuilders",
            targets: ["CollectionBuilders"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/realm/SwiftLint.git",
            exact: "0.56.2"),
        .package(
            url: "https://github.com/Quick/Nimble.git",
            exact: "13.4.0"),
    ],
    targets: [
        .target(
            name: "CollectionBuilders"),
        .testTarget(
            name: "CollectionBuildersTests",
            dependencies: [
                "CollectionBuilders",
                "Nimble",
            ]),
    ]
)

package.targets.forEach { target in

    target.swiftSettings = [
        .enableExperimentalFeature("StrictConcurrency"),
    ]

    target.plugins = [
        .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint"),
    ]
}
