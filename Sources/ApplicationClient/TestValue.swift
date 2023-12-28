import Dependencies

extension DependencyValues {
  public var applicationClient: ApplicationClient {
    get { self[UIApplicationClient.self] }
    set { self[UIApplicationClient.self] = newValue }
  }
}

//MARK: -

extension ApplicationClient: TestDependencyKey {
  public static let testValue = Self(
    setIdleTimerDisabled: unimplemented("\(Self.self).setIdleTimerDisabled")
  )
}
