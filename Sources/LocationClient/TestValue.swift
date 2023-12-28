import Dependencies
import Foundation

extension DependencyValues {
  public var notificationCenterClient: LocationClient {
    get { self[LocationClient.self] }
    set { self[LocationClient.self] = newValue }
  }
}

//MARK: -

extension LocationClient: TestDependencyKey {
  public static var testValue = Self(
    authorizationStatus: unimplemented("\(Self.self).authorizationStatus"),
    requestWhenInUseAuthorization: unimplemented("\(Self.self).requestWhenInUseAuthorization"),
    requestLocation: unimplemented("\(Self.self).requestLocation"),
    delegate: unimplemented("\(Self.self).delegate")
  )
}
