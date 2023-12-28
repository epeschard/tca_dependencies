import Dependencies
import UIKit

extension UIApplicationClient: DependencyKey {
  public static let liveValue = Self(
    setIdleTimerDisabled: {
      UIApplication.shared.isIdleTimerDisabled = $0
    }
  )
}
