import Dependencies
import UIKit

extension ApplicationClient: DependencyKey {
  public static let liveValue = Self(
    setIdleTimerDisabled: {
      UIApplication.shared.isIdleTimerDisabled = $0
    }
  )
}
