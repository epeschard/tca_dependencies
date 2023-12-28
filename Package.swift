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
        "CameraClient",
        "HealthClient",
        "LocationClient",
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
      name: "CameraClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
    .target(
      name: "HealthClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
    .target(
      name: "LocationClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
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
      name: "ReachabilityClient",
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
      name: "CameraClientTests",
      dependencies: [
        "CameraClient"
      ]
    ),
    .testTarget(
      name: "HealthClientTests",
      dependencies: [
        "HealthClient"
      ]
    ),
    .testTarget(
      name: "LocationClientTests",
      dependencies: [
        "LocationClient"
      ]
    ),
    .testTarget(
      name: "NotificationCenterClientTests",
      dependencies: [
        "NotificationCenterClient"
      ]
    ),
    .testTarget(
      name: "ReachabilityClientTests",
      dependencies: [
        "ReachabilityClient"
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
