import Dependencies

extension DependencyValues {
  public var uiApplication: PathMonitorClient {
    get { self[PathMonitorClient.self] }
    set { self[PathMonitorClient.self] = newValue }
  }
}

//MARK: -

extension PathMonitorClient: TestDependencyKey {
  public static let testValue = Self(
    networkPathPublisher: unimplemented("\(Self.self).networkPathPublisher")
  )
}
