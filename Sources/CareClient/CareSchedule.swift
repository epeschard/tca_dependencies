import Foundation

public struct CareSchedule: Codable, Equatable {
  /// The constituent components this schedule was built from.
  public let elements: [CareScheduleElement]

  /// Create a new schedule by combining an array of other `OCKSchedule` objects.
  public init(composing schedules: [CareSchedule]) {
      assert(!schedules.isEmpty, "You cannot create a schedule with 0 elements")
      self.elements = schedules.flatMap { $0.elements }
  }

  /// Create a new schedule by combining an array of other `OCKSchedule` objects.
  public init(composing elements: [CareScheduleElement]) {
      assert(!elements.isEmpty, "You cannot create a schedule with 0 elements")
      self.elements = elements.flatMap { $0.elements }
  }
}

//public struct Schedule: Codable {
//  public let start: Date
//  public let end: Date?
//  public let
//}

public struct CareScheduleElement: Codable, Equatable {
  /// A duration describing the length of an event. Options include all day, or a deterministic number of hours, minutes, or seconds.
  public enum Duration: Codable, Equatable {
    /// Describes an duration that fills an entire date
    case allDay
    
    /// Describes a fixed duration in seconds
    case seconds(Double)
    
    /// Creates a duration that represents a given number of hours.
    public static func hours(_ hours: Double) -> Duration {
      .seconds(60 * 60 * hours)
    }
    
    /// Creates a duration that represents a given number of minutes.
    public static func minutes(_ minutes: Double) -> Duration {
      .seconds(60 * minutes)
    }
    
    private enum CodingKeys: CodingKey {
      case isAllDay
      case seconds
    }
    
    var seconds: TimeInterval {
      switch self {
      case .allDay: return 0
      case .seconds(let seconds): return seconds
      }
    }
    
    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(self == .allDay, forKey: .isAllDay)
      if case .seconds(let seconds) = self {
        try container.encode(seconds, forKey: .seconds)
      }
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      if try container.decodeIfPresent(Bool.self, forKey: .isAllDay) == true {
        self = .allDay
        return
      }
      if let seconds = try container.decodeIfPresent(Double.self, forKey: .seconds) {
        self = .seconds(seconds)
        return
      }
      throw DecodingError.dataCorruptedError(forKey: CodingKeys.seconds, in: container, debugDescription: "No seconds or allDay key was found!")
    }
  }
  
  /// An text about the time this element represents.
  /// e.g. before breakfast on Tuesdays, 5PM every day, etc.
  public var text: String?

  /// The amount of time that the event should take, in seconds.
  public var duration: Duration

  /// The date and time the first event occurs.
  // Note: This must remain a constant because its value is modified by the `isAllDay` flag during initialization.
  public let start: Date

  /// The latest possible time for an event to occur.
  /// - Note: Depending on the interval chosen, it is not guaranteed that an event
  ///         will fall on this date.
  /// - Note: If no date is provided, the schedule will repeat indefinitely.
  public var end: Date?

  /// The amount of time between events specified using `DateCoponents`.
  /// - Note: `DateComponents` are chose over `TimeInterval` to account for edge
  ///         edge cases like daylight savings time and leap years.
  public var interval: DateComponents
  
  public var elements: [CareScheduleElement] {
      return [self]
  }
}

/// `CareNote` can be attached to all other CareKit objects and values. Use cases may include a physician leaving a note on a task when it is modified
/// to explain why a medication dose was changed, or a note left from a patient to a care provider explaining why they weren't able to complete a
/// task on a certain occassion.
public struct CareNote: Codable, Equatable {
  /// The person who created the note.
  public var author: String?
  
  /// A title for the note.
  public var title: String?
  
  /// The note content.
  public var content: String?
}
