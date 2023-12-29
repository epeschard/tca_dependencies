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
        "ApplicationClient",
        "CameraClient",
        "CareClient",
        "HealthClient",
        "LocationClient",
        "NotificationClient",
        "ReachabilityClient",
      ]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
  ],
  targets: [
    .target(
      name: "ApplicationClient",
      dependencies: [
        .product(
          name: "Dependencies",
          package: "swift-dependencies"
        ),
      ]
    ),
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
      name: "CareClient",
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
      name: "NotificationClient",
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
    .testTarget(
      name: "ApplicationClientTests",
      dependencies: [
        "ApplicationClient"
      ]
    ),
    .testTarget(
      name: "CameraClientTests",
      dependencies: [
        "CameraClient"
      ]
    ),
    .testTarget(
      name: "CareClientTests",
      dependencies: [
        "CareClient"
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
      name: "NotificationClientTests",
      dependencies: [
        "NotificationClient"
      ]
    ),
    .testTarget(
      name: "ReachabilityClientTests",
      dependencies: [
        "ReachabilityClient"
      ]
    ),
  ]
)
