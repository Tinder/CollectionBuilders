// swift-tools-version:5.9

import PackageDescription

let packageName = "CollectionBuilders"

enum SwiftLint {
    static let plugin = "SwiftLintPlugin-\(packageName)"
    static let binary = "SwiftLintBinary-\(packageName)"
}

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CollectionBuilders",
            targets: ["CollectionBuilders"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Quick/Nimble.git",
            from: "13.0.0"),
    ],
    targets: [
        .target(
            name: "CollectionBuilders",
            plugins: [
                .plugin(name: SwiftLint.plugin),
            ]),
        .testTarget(
            name: "CollectionBuildersTests",
            dependencies: [
                "CollectionBuilders",
                "Nimble",
            ],
            plugins: [
                .plugin(name: SwiftLint.plugin),
            ]),
        .plugin(
            name: SwiftLint.plugin,
            capability: .buildTool(),
            dependencies: [
                .target(name: SwiftLint.binary)
            ],
            path: "Plugins/SwiftLintPlugin"),
        .binaryTarget(
            name: SwiftLint.binary,
            url: "https://github.com/realm/SwiftLint/releases/download/0.54.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "963121d6babf2bf5fd66a21ac9297e86d855cbc9d28322790646b88dceca00f1"),
    ]
)
