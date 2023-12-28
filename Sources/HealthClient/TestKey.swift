import Dependencies
import XCTestDynamicOverlay

extension DependencyValues {
  public var healthKit: HealthKitClient {
    get { self[HealthKitClient.self] }
    set { self[HealthKitClient.self] = newValue }
  }
}

extension HealthKitClient: TestDependencyKey {
  
  public static let previewValue = Self.noop
  
  public static let testValue = Self(
    authorizationStatus: unimplemented("\(Self.self).authorizationStatus"),
    isHealthDataAvailable: unimplemented("\(Self.self).isHealthDataAvailable"),
    read: unimplemented("\(Self.self).read"),
    requestAuthorization: unimplemented("\(Self.self).requestAuthorization")
  )
}

//MARK: -

extension HealthReading {
  init(value: Double, type: HealthType) {
    self.value = value
    self.type = type
    self.label = HealthKitClient.formatted(value, for: type)
  }
}

//MARK: -

extension HealthKitClient {
  public static let noop = Self(
    authorizationStatus: { _ in .sharingAuthorized },
    isHealthDataAvailable: { true },
    read: { healthType, _ in
      HealthReading(value: 0, type: healthType, label: "0 unit")
    },
    requestAuthorization: {_, _ in }
  )
}

//MARK: - Mocks

extension HealthKitClient {
  public static let mock = Self(
    authorizationStatus: { _ in .sharingAuthorized },
    isHealthDataAvailable: { true },
    read: { healthType, _ in
      switch healthType {
      case .bodyMassIndex:
        let value: Double = 42
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) BMI"
        )
        
      case .heartRate:
        let value: Double = 169
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) BPM"
        )
        
      case .heartRateRecoveryOneMinute:
        let value: Double = 42
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) BPM"
        )
        
      case .heartRateVariabilitySDNN:
        let value: Double = 42
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) ms"
        )
        
      case .respiratoryRate:
        let value: Double = 19
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) breaths/min"
        )
        
      case .restingHeartRate:
        let value: Double = 42
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) BPM"
        )
        
      case .vo2Max:
        let value: Double = 42.69
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) VO₂ max"
        )
        
      case .waistCircumference:
        let value: Double = 42
        return HealthReading(
          value: value,
          type: healthType,
          label: "\(value) in"
        )
      }
    },
    requestAuthorization: {_, _ in }
  )
  
  public static let mockNoAuth = Self(
    authorizationStatus: { _ in .sharingDenied },
    isHealthDataAvailable: { true },
    read: { _, _ in
      throw HealthKitError.authorizationDenied
    },
    requestAuthorization: { _, _ in }
  )
}
