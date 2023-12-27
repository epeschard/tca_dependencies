// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "tca_dependencies",
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
      name: "NotificationCenterClient"
    ),
    .target(
      name: "PathMonitorClient"
    ),
    .target(
      name: "UIApplicationClient"
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
