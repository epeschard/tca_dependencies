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

public protocol NotificationCenterProtocol {
  var `default`: NotificationCenter { get }

  func addObserver(
    _ observer: Any,
    selector aSelector: Selector,
    name aName: NSNotification.Name?,
    object anObject: Any?
  )


  func post(_ notification: Notification)

  func post(
    name aName: NSNotification.Name,
    object anObject: Any?
  )

  func post(
    name aName: NSNotification.Name,
    object anObject: Any?,
    userInfo aUserInfo: [AnyHashable : Any]?
  )


  func removeObserver(_ observer: Any)

  func removeObserver(
    _ observer: Any,
    name aName: NSNotification.Name?,
    object anObject: Any?
  )


  @available(iOS 4.0, *)
  func addObserver(
    forName name: NSNotification.Name?,
    object obj: Any?,
    queue: OperationQueue?,
    using block: @escaping @Sendable (Notification) -> Void
  ) -> NSObjectProtocol
}
