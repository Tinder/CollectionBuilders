// swift-tools-version:5.10

import Foundation
import PackageDescription

let environment = ProcessInfo.processInfo.environment

let treatWarningsAsErrors = environment["CI"] == "true"
let enableSwiftLintBuildToolPlugin = environment["CODEQL_DIST"] == nil

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
    ]
)

package.targets.forEach { target in

    let types: [Target.TargetType] = [
        .regular,
        .test,
        .executable,
    ]

    guard types.contains(target.type)
    else { return }

    target.swiftSettings = (target.swiftSettings ?? []) + [.enableExperimentalFeature("StrictConcurrency")]

//    if treatWarningsAsErrors {
//        target.swiftSettings = (target.swiftSettings ?? []) + [
//            .treatAllWarnings(as: .error),
//            .treatWarning("DeprecatedDeclaration", as: .warning),
//        ]
//    }

    if enableSwiftLintBuildToolPlugin {
        target.plugins = (target.plugins ?? []) + [
            .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint"),
        ]
    }
}
