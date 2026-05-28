// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "IOSLaunchLab",
    products: [
        .executable(name: "IOSLaunchLab", targets: ["IOSLaunchLab"])
    ],
    targets: [
        .executableTarget(name: "IOSLaunchLab")
    ]
)
