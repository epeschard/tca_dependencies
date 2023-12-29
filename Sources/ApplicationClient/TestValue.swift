import Dependencies

extension DependencyValues {
  public var applicationClient: ApplicationClient {
    get { self[ApplicationClient.self] }
    set { self[ApplicationClient.self] = newValue }
  }
}

//MARK: -

extension ApplicationClient: TestDependencyKey {
  public static let testValue = Self(
    setIdleTimerDisabled: unimplemented("\(Self.self).setIdleTimerDisabled")
  )
}
