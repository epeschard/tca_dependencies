import Dependencies

extension DependencyValues {
  public var careKit: CareKitClient {
    get { self[CareKitClient.self] }
    set { self[CareKitClient.self] = newValue }
  }
}

//MARK: -

extension CareKitClient: TestDependencyKey {
  public static let testValue = Self(
    addOnboardingTask: unimplemented("\(Self.self).addOnboardingTask"),
    addTask: unimplemented("\(Self.self).addTask"), 
    fetchTasks: unimplemented("\(Self.self).fetchTasks")
  )
}
