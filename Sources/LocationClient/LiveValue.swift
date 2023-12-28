import Combine
import CoreLocation

@available(iOS 13.0, *)
extension LocationClient {
  public static var live: Self {
    class Delegate: NSObject, CLLocationManagerDelegate {
      let subject: PassthroughSubject<DelegateEvent, Never>
      
      init(subject: PassthroughSubject<DelegateEvent, Never>) {
        self.subject = subject
      }
      
      func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
      ) {
        self.subject.send(
          .didChangeAuthorization(status)
        )
      }
      
      func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
      ) {
        self.subject.send(
          .didUpdateLocations(locations)
        )
      }
      
      func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
      ) {
        self.subject.send(
          .didFailWithError(error)
        )
      }
    }
    
    let locationManager = CLLocationManager()
    let subject = PassthroughSubject<DelegateEvent, Never>()
    var delegate: Delegate? = Delegate(subject: subject)
    locationManager.delegate = delegate
    
    return Self(
      authorizationStatus: {
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
          authorizationStatus = CLLocationManager().authorizationStatus
        } else { //Deprecated instance
          authorizationStatus = CLLocationManager.authorizationStatus()
        }
        return authorizationStatus
      },
      requestWhenInUseAuthorization: locationManager.requestWhenInUseAuthorization,
      requestLocation: locationManager.requestLocation,
      delegate: subject
        .handleEvents(receiveCancel: { delegate = nil })
        .eraseToAnyPublisher()
    )
  }
}
