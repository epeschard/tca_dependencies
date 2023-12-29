import Foundation
import Models

public struct CareKitClient {
  public var addOnboardingTask: @Sendable () async throws -> Void
  public var addTask: @Sendable (Crack, Date, Date?, DateComponents) async throws -> Void
  public var fetchTasks: @Sendable (DateInterval) async throws -> [CareTask]
//  public var scheduleTask: @Sendable () async throws -> CareTask
}
