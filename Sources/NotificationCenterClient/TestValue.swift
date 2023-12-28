import Dependencies
import Foundation

extension DependencyValues {
  public var notificationCenterClient: NotificationCenterClient {
    get { self[NotificationCenterClient.self] }
    set { self[NotificationCenterClient.self] = newValue }
  }
}

//MARK: -

extension NotificationCenterClient: TestDependencyKey {
  public static var testValue = Self(
    addObserver: unimplemented("\(Self.self).addObserver"),
    postA: unimplemented("\(Self.self).postA"),
    post: unimplemented("\(Self.self).post"),
    removeObserver: unimplemented("\(Self.self).removeObserver")
  )
}
