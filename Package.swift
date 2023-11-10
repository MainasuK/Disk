// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Disk",
    platforms: [
        .iOS(.v12),
        .watchOS(.v4),
        .macOS(.v10_13),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "Disk", targets: ["Disk"])
    ],
    targets: [
        .target(
            name: "Disk"
        ),
        .testTarget(
            name: "DiskTests",
            dependencies: ["Disk"]
        )
    ]
)
