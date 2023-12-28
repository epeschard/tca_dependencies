public struct HealthKitClient {
  public var authorizationStatus: @Sendable (HealthType) -> AuthStatus
  public var isHealthDataAvailable: () -> Bool
  
  public var read: @Sendable(HealthType, Int) async throws -> HealthReading

  public var requestAuthorization: @Sendable (Set<HealthType>, Set<HealthType>) async throws -> Void
  
  public enum AuthStatus: Int, @unchecked Sendable {
    case notDetermined = 0
    case sharingDenied = 1
    case sharingAuthorized = 2
  }
}

public extension HealthKitClient {
  static func formatted(
    _ value: Double,
    for healthType: HealthType
  ) -> String {
    switch healthType {
    case .bodyMassIndex:
      return String(format: "%.1f BMI", value)

    case .heartRate:
      return String(format: "%.0f BPM", value)

    case .heartRateRecoveryOneMinute:
      return String(format: "%.0f BPM", value)

    case .heartRateVariabilitySDNN:
      return String(format: "%.0f ms", value)

    case .respiratoryRate:
      return String(format: "%.0f breaths/min", value)

    case .restingHeartRate:
      return String(format: "%.0f BPM", value)

    case .vo2Max:
      return String(format: "%.2f VO₂ max", value)

    case .waistCircumference:
      return String(format: "%.1f in", value)
    }
  }
}

public struct HealthReading: Equatable {
  public var value: Double
  public var type: HealthType
  public var label: String
  
  public init(
    value: Double,
    type: HealthType,
    label: String
  ) {
    self.value = value
    self.type = type
    self.label = label
  }
}

public enum HealthType {
  case bodyMassIndex
  case heartRate
  case heartRateRecoveryOneMinute
  case heartRateVariabilitySDNN
  case respiratoryRate
  case restingHeartRate
  case vo2Max
  case waistCircumference
}

public enum HealthKitError: Error, Equatable {
  case authorizationDenied
  case authorizationNotDetermined
  case authorizationRestricted
  case healthDataUnavailable
  case readHealthDataFailed(String)
  case authRequestFailed(String)
}
