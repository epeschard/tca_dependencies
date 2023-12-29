import Foundation

public struct NotificationClient {
  var addObserver: (
    _ observer: Any,
    _ aSelector: Selector,
    _ aName: NSNotification.Name?,
    _ anObject: Any?
  ) -> Void

  var `default`: NotificationCenter

  var postA: (_ notification: Notification) -> Void
  var post: (
    _ aName: NSNotification.Name,
    _ anObject: Any?, 
    _ aUserInfo: [AnyHashable : Any]?
  ) -> Void
  var removeObserver: (
    _ observer: Any,
    _ aName: NSNotification.Name?,
    _ anObject: Any?
  ) -> Void

  public init(
    addObserver: @escaping (_: Any, _: Selector, _: NSNotification.Name?, _: Any?) -> Void,
    `default`: NotificationCenter = NotificationCenter.default,
    postA: @escaping (_: Notification) -> Void,
    post: @escaping (_: NSNotification.Name, _: Any?, _: [AnyHashable : Any]?) -> Void,
    removeObserver: @escaping (_: Any, _: NSNotification.Name?, _: Any?) -> Void
  ) {
    self.addObserver = addObserver
    self.default = `default`
    self.postA = postA
    self.post = post
    self.removeObserver = removeObserver
  }
}
