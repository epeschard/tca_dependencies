import Dependencies
import HealthKit

extension HealthKitClient: DependencyKey {
  public static let liveValue = Self(
    authorizationStatus: { healthType in
      let healthStore = HKHealthStore()
      switch healthType {
      case .bodyMassIndex:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .bodyMassIndex)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .heartRate:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .heartRate)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .heartRateRecoveryOneMinute:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .heartRateRecoveryOneMinute)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .heartRateVariabilitySDNN:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .respiratoryRate:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .respiratoryRate)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .restingHeartRate:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .restingHeartRate)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .vo2Max:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .vo2Max)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
        
      case .waistCircumference:
        guard
          let type = HKObjectType.quantityType(forIdentifier: .waistCircumference)
        else {
          return AuthStatus.notDetermined
        }
        let authorizationStatus = healthStore.authorizationStatus(for: type)
        return AuthStatus(rawValue: authorizationStatus.rawValue)!
      }
      
    },
    
    isHealthDataAvailable: {
      HKHealthStore.isHealthDataAvailable()
    },
    
    read: { healthType, limit in
      let type = type(from: healthType)
      let predicate = HKSamplePredicate.quantitySample(type: type)
      let queryDescriptor = HKSampleQueryDescriptor(
        predicates: [predicate],
        sortDescriptors: [SortDescriptor(\.endDate, order: .reverse)],
        limit: limit
      )
      let store = HKHealthStore()
      do {
        let results = try await queryDescriptor.result(for: store)
        let unit = unit(from: healthType)
        let total = results.reduce(0.0) {
          $0 + $1.quantity.doubleValue(for: unit)
        }
        let average = total / Double(limit)
        
        let label = formatted(average, for: healthType)
        return HealthReading(
          value: average,
          type: healthType,
          label: label
        )
      } catch {
        throw HealthKitError.readHealthDataFailed(
          String(describing: error)
        )
      }
    },
    
    requestAuthorization: { healthTypesToShare, healthTypesToRead in
      var typesToShare = Set<HKSampleType>()
      
      for healthType in healthTypesToShare {
        switch healthType {
        case .bodyMassIndex:
          if let type = HKSampleType.quantityType(
            forIdentifier: .bodyMassIndex
          ) {
            typesToShare.insert(type)
          }
          
        case .heartRate:
          if let type = HKSampleType.quantityType(
            forIdentifier: .heartRate
          ) {
            typesToShare.insert(type)
          }
          
        case .heartRateRecoveryOneMinute:
          if let type = HKSampleType.quantityType(
            forIdentifier: .heartRateRecoveryOneMinute
          ) {
            typesToShare.insert(type)
          }
          
        case .heartRateVariabilitySDNN:
          if let type = HKSampleType.quantityType(
            forIdentifier: .heartRateVariabilitySDNN
          ) {
            typesToShare.insert(type)
          }
        case .respiratoryRate:
          if let type = HKSampleType.quantityType(
            forIdentifier: .respiratoryRate
          ) {
            typesToShare.insert(type)
          }
        case .restingHeartRate:
          if let type = HKSampleType.quantityType(
            forIdentifier: .restingHeartRate
          ) {
            typesToShare.insert(type)
          }
        case .vo2Max:
          if let type = HKSampleType.quantityType(
            forIdentifier: .vo2Max
          ) {
            typesToShare.insert(type)
          }
        case .waistCircumference:
          if let type = HKSampleType.quantityType(
            forIdentifier: .waistCircumference
          ) {
            typesToShare.insert(type)
          }
        }
      }
      
      var typesToRead = Set<HKObjectType>()
      
      for healthType in healthTypesToRead {
        switch healthType {
        case .bodyMassIndex:
          if let type = HKObjectType.quantityType(
            forIdentifier: .bodyMassIndex
          ) {
            typesToRead.insert(type)
          }
          
        case .heartRate:
          if let type = HKObjectType.quantityType(
            forIdentifier: .heartRate
          ) {
            typesToRead.insert(type)
          }
          
        case .heartRateRecoveryOneMinute:
          if let type = HKObjectType.quantityType(
            forIdentifier: .heartRateRecoveryOneMinute
          ) {
            typesToRead.insert(type)
          }
          
        case .heartRateVariabilitySDNN:
          if let type = HKObjectType.quantityType(
            forIdentifier: .heartRateVariabilitySDNN
          ) {
            typesToRead.insert(type)
          }
        case .respiratoryRate:
          if let type = HKObjectType.quantityType(
            forIdentifier: .respiratoryRate
          ) {
            typesToRead.insert(type)
          }
        case .restingHeartRate:
          if let type = HKObjectType.quantityType(
            forIdentifier: .restingHeartRate
          ) {
            typesToRead.insert(type)
          }
        case .vo2Max:
          if let type = HKObjectType.quantityType(
            forIdentifier: .vo2Max
          ) {
            typesToRead.insert(type)
          }
        case .waistCircumference:
          if let type = HKObjectType.quantityType(
            forIdentifier: .waistCircumference
          ) {
            typesToRead.insert(type)
          }
        }
      }
      
      do {
        try await HKHealthStore().requestAuthorization(
          toShare: typesToShare,
          read: typesToRead
        )
      } catch {
        let errorString = String(describing: error)
        throw HealthKitError.authRequestFailed(errorString)
      }
    }
  )
}

//MARK: - Private

private extension HealthKitClient {
  static func type(from healthType: HealthType) -> HKQuantityType {
    switch healthType {
    case .bodyMassIndex:
      return HKQuantityType(.bodyMassIndex)
      
    case .heartRate:
      return HKQuantityType(.heartRate)
      
    case .heartRateRecoveryOneMinute:
      return HKQuantityType(.heartRateRecoveryOneMinute)
      
    case .heartRateVariabilitySDNN:
      return HKQuantityType(.heartRateVariabilitySDNN)
      
    case .respiratoryRate:
      return HKQuantityType(.respiratoryRate)
      
    case .restingHeartRate:
      return HKQuantityType(.restingHeartRate)
      
    case .vo2Max:
      return HKQuantityType(.vo2Max)
      
    case .waistCircumference:
      return HKQuantityType(.waistCircumference)
    }
  }
  
  static func unit(from healthType: HealthType) -> HKUnit {
    switch healthType {
    case .bodyMassIndex:
      // use HKUnit(from: "count") to represent the BMI,
      // because HealthKit stores BMI as a scalar value without any units,
      // similar to a count.
      return HKUnit(from: "count")
      
    case .heartRate:
      // use HKUnit(from: "count/min") to represent bpm
      return HKUnit(from: "count/min")
      
    case .heartRateRecoveryOneMinute:
      // use HKUnit(from: "count/min") to represent bpm
      return HKUnit(from: "count/min")
      
    case .heartRateVariabilitySDNN:
      // use HKUnit.secondUnit(with: .milli) to represent HRV in ms,
      return HKUnit.secondUnit(with: .milli)
      
    case .respiratoryRate:
      // use HKUnit(from: "count/min") to represent breaths/min
      return HKUnit(from: "count/min")
      
    case .restingHeartRate:
      // use HKUnit(from: "count/min") to represent bpm,
      return HKUnit(from: "count/min")
      
    case .vo2Max:
      // use HKUnit(from: "ml/kg*min") to represent VO₂ max
      return HKUnit(from: "ml/kg*min")
      
    case .waistCircumference:
      return HKUnit.inch()
    }
  }
}
