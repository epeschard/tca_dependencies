import AVFoundation

public struct CameraClient {
  public var canSetSessionPreset: (_ preset: AVCaptureSession.Preset) -> Bool
  public var sessionPreset: AVCaptureSession.Preset

  public var inputs: [AVCaptureInput]
  public var canAddInput: (_: AVCaptureInput) -> Bool
  public var addInput: (_: AVCaptureInput) -> Void
  public var removeInput: (_: AVCaptureInput) -> Void

  public var outputs: [AVCaptureOutput]
  public var canAddOutput: (_: AVCaptureOutput) -> Bool
  public var addOutput: (_: AVCaptureOutput) -> Void
  public var removeOutput: (_: AVCaptureOutput) -> Void

  public var addInputWithNoConnections: (_: AVCaptureInput) -> Void
  public var addOutputWithNoConnections: (_: AVCaptureOutput) -> Void

  public var connections: [AVCaptureConnection]
  public var canAddConnection: (_: AVCaptureConnection) -> Bool
  public var addConnection: (_: AVCaptureConnection) -> Void
  public var removeConnection: (_: AVCaptureConnection) -> Void

  public var beginConfiguration: () -> Void
  public var commitConfiguration: () -> Void

  public var isRunning: Bool
  public var isInterrupted: Bool
  public var isMultitaskingCameraAccessSupported: Bool
  public var isMultitaskingCameraAccessEnabled: Bool
  public var usesApplicationAudioSession: Bool
  public var automaticallyConfiguresApplicationAudioSession: Bool
  public var automaticallyConfiguresCaptureDeviceForWideColor: Bool

  public var startRunning: () -> Void
  public var stopRunning: () -> Void

  public init(
    canSetSessionPreset: @escaping (AVCaptureSession.Preset) -> Bool,
    sessionPreset: AVCaptureSession.Preset,
    inputs: [AVCaptureInput],
    canAddInput: @escaping (AVCaptureInput) -> Bool,
    addInput: @escaping (AVCaptureInput) -> Void,
    removeInput: @escaping (AVCaptureInput) -> Void,
    outputs: [AVCaptureOutput],
    canAddOutput: @escaping (AVCaptureOutput) -> Bool,
    addOutput: @escaping (AVCaptureOutput) -> Void,
    removeOutput: @escaping (AVCaptureOutput) -> Void,
    addInputWithNoConnections: @escaping (AVCaptureInput) -> Void,
    addOutputWithNoConnections: @escaping (AVCaptureOutput) -> Void,
    connections: [AVCaptureConnection],
    canAddConnection: @escaping (AVCaptureConnection) -> Bool,
    addConnection: @escaping (AVCaptureConnection) -> Void,
    removeConnection: @escaping (AVCaptureConnection) -> Void,
    beginConfiguration: @escaping () -> Void,
    commitConfiguration: @escaping () -> Void,
    isRunning: Bool,
    isInterrupted: Bool,
    isMultitaskingCameraAccessSupported: Bool,
    isMultitaskingCameraAccessEnabled: Bool,
    usesApplicationAudioSession: Bool,
    automaticallyConfiguresApplicationAudioSession: Bool,
    automaticallyConfiguresCaptureDeviceForWideColor: Bool,
    startRunning: @escaping () -> Void,
    stopRunning: @escaping () -> Void
  ) {
    self.canSetSessionPreset = canSetSessionPreset
    self.canAddInput = canAddInput
    self.addInput = addInput
    self.removeInput = removeInput
    self.canAddOutput = canAddOutput
    self.addOutput = addOutput
    self.removeOutput = removeOutput
    self.addInputWithNoConnections = addInputWithNoConnections
    self.addOutputWithNoConnections = addOutputWithNoConnections
    self.canAddConnection = canAddConnection
    self.addConnection = addConnection
    self.removeConnection = removeConnection
    self.beginConfiguration = beginConfiguration
    self.commitConfiguration = commitConfiguration
    self.startRunning = startRunning
    self.stopRunning = stopRunning
    self.sessionPreset = sessionPreset
    self.inputs = inputs
    self.outputs = outputs
    self.connections = connections
    self.isRunning = isRunning
    self.isInterrupted = isInterrupted
    self.isMultitaskingCameraAccessSupported = isMultitaskingCameraAccessSupported
    self.isMultitaskingCameraAccessEnabled = isMultitaskingCameraAccessEnabled
    self.usesApplicationAudioSession = usesApplicationAudioSession
    self.automaticallyConfiguresApplicationAudioSession = automaticallyConfiguresApplicationAudioSession
    self.automaticallyConfiguresCaptureDeviceForWideColor = automaticallyConfiguresCaptureDeviceForWideColor
  }
}

