import CareKit
import Dependencies
import Foundation
import Models

extension CareKitClient: DependencyKey {
  public static let liveValue = Self(
    addOnboardingTask: {
      let store = OCKStore(
        name: ID.storeName.rawValue,
        type: .onDisk
      )
      let onboardingSchedule = OCKSchedule.dailyAtTime(
        hour: 0,
        minutes: 0,
        start: Date(),
        end: nil,
        text: "Task Due!",
        duration: .allDay
      )
      var onboardTask = OCKTask(
        id: ID.onboarding.rawValue,
        title: "Onboard",
        carePlanID: nil,
        schedule: onboardingSchedule
      )
      onboardTask.instructions = "You'll need to agree to some terms and conditions before we get started"
      onboardTask.impactsAdherence = false
      let _ = try await store.addTask(onboardTask)
    },
    addTask: { crack, start, end, interval in
      //MARK: OCKStore
      let store = OCKStore(
        name: ID.storeName.rawValue,
        type: .onDisk
      )
      
//      let startOfDay = Calendar.current.startOfDay(
//        for: Date()
//      )
//      let atBreakfast = Calendar.current.date(
//        byAdding: .hour,
//        value: 8,
//        to: startOfDay
//      )!
      
      let dailyAtBreakfast = OCKScheduleElement(
        start: start,
        end: end,
        interval: interval
      )
      
//      let atLunch = Calendar.current.date(
//        byAdding: .hour,
//        value: 12,
//        to: startOfDay
//      )!
//      let everyTwoDaysAtLunch = OCKScheduleElement(
//        start: atLunch,
//        end: nil,
//        interval: DateComponents(day: 2)
//      )
      //MARK: OCKSchedule
      let schedule = OCKSchedule(
        composing: [
          dailyAtBreakfast,
//          everyTwoDaysAtLunch
        ]
      )
      
      var task = OCKTask(
        id: crack.id,
        title: crack.title,
        carePlanID: nil,
        schedule: schedule
      )
      task.instructions = crack.detail
      task.impactsAdherence = true
      let careTask = try await store.addTask(task)
    },
    fetchTasks: { dateInterval in
      let store = OCKStore(
        name: ID.storeName.rawValue,
        type: .onDisk
      )
      let query = OCKTaskQuery(dateInterval: dateInterval)
      let anyTasks: [OCKAnyTask] = try await store.fetchTasks(query: query)
      return anyTasks.map { CareTask(with: $0) }
    }
  )
  
  public enum ID: String {
    case onboarding
    case storeName = "org.biocrackers.store"
  }
}

extension OCKStore {
  func fetchTasks (
    query: OCKAnyTaskQuery,
    callBackQueue: DispatchQueue = .main
  ) async throws -> [OCKAnyTask] {
    try await withCheckedThrowingContinuation { continuation in
      fetchAnyTasks(
        query: query,
        callbackQueue: callBackQueue
      ) { result in
        switch result {
        case .success(let tasks):
          continuation.resume(returning: tasks)
          
        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }
}

extension CareTask {
  public init(with task: OCKAnyTask) {
    self.groupIdentifier = task.groupIdentifier
    self.id = task.id
    self.impactsAdherence = task.impactsAdherence
    self.instructions = task.instructions
//    self.notes = task.notes
    self.remoteID = task.remoteID
//    self.schedule = CareSchedule(with: task.schedule)
    self.title = task.title
  }
}
    
extension CareSchedule {
  public init(with schedule: OCKSchedule) {
    self.elements = schedule.elements.map {
      CareScheduleElement(
        duration: CareScheduleElement.Duration(with: $0.duration),
        start: $0.start,
        end: $0.end,
        interval: $0.interval
      )
    }
  }
}

extension CareScheduleElement.Duration {
  public init(with duration: OCKScheduleElement.Duration) {
    switch duration {
    case .allDay:
      self = .allDay
      
    case let .seconds(seconds):
      self = .seconds(seconds)
    }
  }
}

extension OCKStore {
  func addTask(
    _ task: Task,
    callBackQueue: DispatchQueue = .main
  ) async throws -> OCKTask {
    try await withCheckedThrowingContinuation { continuation in
      addTask(
        task,
        callbackQueue: callBackQueue
      ) { result in
        switch result {
        case .success(let task):
          continuation.resume(returning: task)
          
        case .failure(let error):
          let mappedError: CareKitError
          switch error {
          case let .addFailed(reason: reason):
            mappedError = CareKitError.addFailed(reason: reason)

          case let .deleteFailed(reason: reason):
            mappedError =  CareKitError.deleteFailed(reason: reason)

          case let .fetchFailed(reason: reason):
            mappedError =  CareKitError.fetchFailed(reason: reason)

          case let .invalidValue(reason: reason):
            mappedError =  CareKitError.invalidValue(reason: reason)

          case let .timedOut(reason: reason):
            mappedError =  CareKitError.timedOut(reason: reason)

          case let .updateFailed(reason: reason):
            mappedError =  CareKitError.updateFailed(reason: reason)
          }
          continuation.resume(throwing: mappedError)
        }
      }
    }
  }
}
