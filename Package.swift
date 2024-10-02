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
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.0.0")),
    ],
    targets: [
        .target(
            name: "HumorAPIService",
            dependencies: [
                .product(name: "RxMoya", package: "Moya"),
                .product(name: "RealmSwift", package: "realm-swift"),
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
