import Foundation

public struct CareTask: Codable, Equatable, Identifiable {
  public var groupIdentifier: String?
  public var id: String
  public var impactsAdherence: Bool
  public var instructions: String?
  public var notes: [CareNote]?
  public var remoteID: String?
//  public var schedule: CareSchedule
  public var title: String?
  
  public init(
    groupIdentifier: String? = nil,
    id: String,
    impactsAdherence: Bool,
    instructions: String? = nil,
    notes: [CareNote]? = nil,
    remoteID: String? = nil,
//    schedule: CareSchedule,
    title: String? = nil
  ) {
    self.groupIdentifier = groupIdentifier
    self.id = id
    self.impactsAdherence = impactsAdherence
    self.instructions = instructions
    self.notes = notes
    self.remoteID = remoteID
//    self.schedule = schedule
    self.title = title
  }
}

//MARK: - Mock

extension CareTask {
  public static var mock = CareTask(
    groupIdentifier: "Mock groupIdentifier",
    id: "00000000000000000000",
    impactsAdherence: false,
    instructions: "Mock instructions",
    notes: nil,
    remoteID: "Mock remote ID",
//    schedule: .init(composing: [.i]),
    title: "Mock title"
  )
}

//extension CareSchedule {
//  public static var mock = CareSchedule(
//}
