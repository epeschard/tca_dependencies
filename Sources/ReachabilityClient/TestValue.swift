import Dependencies

extension DependencyValues {
  public var reachabilityClient: ReachabilityClient {
    get { self[PathMonitorClient.self] }
    set { self[PathMonitorClient.self] = newValue }
  }
}

//MARK: -

extension ReachabilityClient: TestDependencyKey {
  public static let testValue = Self(
    networkPathPublisher: unimplemented("\(Self.self).networkPathPublisher")
  )
}
