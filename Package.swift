// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "tca_dependencies",
  platforms: [
    .macOS(.v13),
    .iOS(.v16),
    .tvOS(.v16),
    .watchOS(.v9)
  ],
  products: [
    .library(
      name: "tca_dependencies",
      targets: [
        "NotificationCenterClient",
        "PathMonitorClient",
        "UIApplicationClient",
      ]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
  ],
  targets: [
    .target(
      name: "NotificationCenterClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
    .target(
      name: "PathMonitorClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
    .target(
      name: "UIApplicationClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
    .testTarget(
      name: "NotificationCenterClientTests",
      dependencies: [
        "NotificationCenterClient"
      ]
    ),
    .testTarget(
      name: "PathMonitorClientTests",
      dependencies: [
        "PathMonitorClient"
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
