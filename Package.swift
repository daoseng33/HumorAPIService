// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HumorAPIService",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HumorAPIService",
            targets: ["HumorAPIService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/daoseng33/HumorDataModel.git", branch: "main")
    ],
    targets: [
        .target(
            name: "HumorAPIService",
            dependencies: [
                .product(name: "RxMoya", package: "Moya"),
                "HumorDataModel"
            ],
            resources: [.process("SampleData")]
        ),
        .testTarget(
            name: "HumorAPIServiceTests",
            dependencies: [
                "HumorAPIService",
                .product(name: "RxBlocking", package: "RxSwift")
            ]
        ),
    ]
)
