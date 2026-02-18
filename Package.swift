// swift-tools-version:5.10

import Foundation
import PackageDescription

let enableSwiftLintBuildToolPlugin = ProcessInfo.processInfo.environment["CODEQL_DIST"] == nil

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
            exact: "0.59.1"),
        .package(
            url: "https://github.com/Quick/Nimble.git",
            exact: "14.0.0"),
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
    ],
)

package.targets.forEach { target in

    target.swiftSettings = [
        .enableExperimentalFeature("StrictConcurrency"),
    ]

    if enableSwiftLintBuildToolPlugin {
        target.plugins = [
            .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint"),
        ]
    }
}
