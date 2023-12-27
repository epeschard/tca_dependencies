// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "tca_dependencies",
  products: [
    .library(
      name: "tca_dependencies",
      targets: [
        "UIApplicationClient",
      ]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
  ],
  targets: [
    .target(
      name: "UIApplicationClient",
      dependencies: [
        
      ]
    ),
    .testTarget(
      name: "UIApplicationClientTests",
      dependencies: [
        "UIApplicationClient"
      ]
    ),
  ]
)
