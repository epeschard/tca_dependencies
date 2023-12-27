import Dependencies
import Foundation

extension NotificationCenterClient: DependencyKey {
  public static var liveValue: Self {
    let notificationCenter = NotificationCenter.default

    return Self(
      addObserver: notificationCenter.addObserver(forName:object:queue:using:),
      postA: notificationCenter.post(_:),
      post: notificationCenter.post(name:object:userInfo:),
      removeObserver: notificationCenter.removeObserver(_:name:object:)
    )
  }
}
