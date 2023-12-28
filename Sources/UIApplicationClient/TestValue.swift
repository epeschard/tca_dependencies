import Dependencies

extension DependencyValues {
  public var uiApplication: UIApplicationClient {
    get { self[UIApplicationClient.self] }
    set { self[UIApplicationClient.self] = newValue }
  }
}

//MARK: -

extension UIApplicationClient: TestDependencyKey {
  public static let testValue = Self(
    setIdleTimerDisabled: unimplemented("\(Self.self).setIdleTimerDisabled")
  )
}
