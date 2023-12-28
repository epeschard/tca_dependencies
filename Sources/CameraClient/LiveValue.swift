import AVFoundation
import Dependencies

extension CameraClient: DependencyKey {
  public static var liveValue: Self {
    let session = AVCaptureSession()

    let isMultitaskingCameraAccessSupported: Bool
    let isMultitaskingCameraAccessEnabled: Bool
    if #available(iOS 16.0, *) {
      isMultitaskingCameraAccessSupported = session.isMultitaskingCameraAccessSupported
      isMultitaskingCameraAccessEnabled = session.isMultitaskingCameraAccessEnabled
    } else {
      isMultitaskingCameraAccessSupported = false
      isMultitaskingCameraAccessEnabled = false
    }

    return Self(
      canSetSessionPreset: session.canSetSessionPreset(_:),
      sessionPreset: session.sessionPreset,
      inputs: session.inputs,
      canAddInput: session.canAddInput(_:),
      addInput: session.addInput(_:),
      removeInput: session.removeInput(_:),
      outputs: session.outputs,
      canAddOutput: session.canAddOutput(_:),
      addOutput: session.addOutput(_:),
      removeOutput: session.removeOutput(_:),
      addInputWithNoConnections: session.addInputWithNoConnections(_:),
      addOutputWithNoConnections: session.addOutputWithNoConnections(_:),
      connections: session.connections,
      canAddConnection: session.canAddConnection(_:),
      addConnection: session.addConnection(_:),
      removeConnection: session.removeConnection(_:),
      beginConfiguration: session.beginConfiguration,
      commitConfiguration: session.commitConfiguration,
      isRunning: session.isRunning,
      isInterrupted: session.isInterrupted,
      isMultitaskingCameraAccessSupported: isMultitaskingCameraAccessSupported,
      isMultitaskingCameraAccessEnabled: isMultitaskingCameraAccessEnabled,
      usesApplicationAudioSession: session.usesApplicationAudioSession,
      automaticallyConfiguresApplicationAudioSession: session.automaticallyConfiguresApplicationAudioSession,
      automaticallyConfiguresCaptureDeviceForWideColor: session.automaticallyConfiguresCaptureDeviceForWideColor,
      startRunning: session.startRunning,
      stopRunning: session.stopRunning
    )
  }
}
