import Dependencies
import Foundation

extension NotificationClient: DependencyKey {
  public static var liveValue: Self {
    let notificationCenter = NotificationCenter.default
    Noti

    return Self(
      addObserver: notificationCenter.addObserver(_:selector:name:object:),
      postA: notificationCenter.post(_:),
      post: notificationCenter.post(name:object:userInfo:),
      removeObserver: notificationCenter.removeObserver(_:name:object:)
    )
  }
}
