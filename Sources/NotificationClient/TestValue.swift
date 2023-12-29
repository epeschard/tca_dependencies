import Dependencies
import Foundation

extension DependencyValues {
  public var notificationClient: NotificationClient {
    get { self[NotificationClient.self] }
    set { self[NotificationClient.self] = newValue }
  }
}

//MARK: -

extension NotificationClient: TestDependencyKey {
  public static var testValue = Self(
    addObserver: unimplemented("\(Self.self).addObserver"),
    postA: unimplemented("\(Self.self).postA"),
    post: unimplemented("\(Self.self).post"),
    removeObserver: unimplemented("\(Self.self).removeObserver")
  )
}
