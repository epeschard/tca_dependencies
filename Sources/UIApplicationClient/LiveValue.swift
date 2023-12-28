import Dependencies
import UIKit

extension UIApplicationClient: DependencyKey {
  public static let liveValue = Self(
    setIdleTimerDisabled: { isDisabled in
      UIApplication.shared.isIdleTimerDisabled = isDisabled
    }
  )
}
