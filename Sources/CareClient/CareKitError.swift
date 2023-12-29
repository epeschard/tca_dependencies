import Foundation

public enum CareKitError: Error, Equatable {
  ///Occurs when adding an entity fails.
  case addFailed(reason: String)

  ///Occurs when deleting an existing entity fails.
  case deleteFailed(reason: String)

  ///Occurs when a fetch fails.
  case fetchFailed(reason: String)

  ///Occurs when an invalid value is passed.
  case invalidValue(reason: String)

  ///Occurs when an asynchronous action takes too long.
  ///This is intended for use by remote databases.
  case timedOut(reason: String)
  
  ///Occurs when an update to an existing entity fails.
  case updateFailed(reason: String)
}

extension CareKitError: LocalizedError {
  public var errorDescription: String? {
      switch self {
      case .addFailed(let reason): return "Failed to add: \(reason)"
      case .deleteFailed(let reason): return "Failed to delete: \(reason)"
      case .fetchFailed(let reason): return "Failed to fetch: \(reason)"
      case .invalidValue(let reason): return "Invalid value: \(reason)"
      case .timedOut(let reason): return "Timed out: \(reason)"
      case .updateFailed(let reason): return "Failed to update: \(reason)"
      }
  }
}
