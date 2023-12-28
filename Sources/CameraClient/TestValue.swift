import Dependencies

extension DependencyValues {
  public var cameraClient: CameraClient {
    get { self[CameraClient.self] }
    set { self[CameraClient.self] = newValue }
  }
}

extension CameraClient: TestDependencyKey {

  public static let previewValue = Self.noop

  public static let testValue = Self(
    canSetSessionPreset: unimplemented("\(Self.self).canSetSessionPreset"),
    sessionPreset: unimplemented("\(Self.self).sessionPreset"),
    inputs: unimplemented("\(Self.self).inputs"),
    canAddInput: unimplemented("\(Self.self).canAddInput"),
    addInput: unimplemented("\(Self.self).addInput"),
    removeInput: unimplemented("\(Self.self).removeInput"),
    outputs: unimplemented("\(Self.self).outputs"),
    canAddOutput: unimplemented("\(Self.self).canAddOutput"),
    addOutput: unimplemented("\(Self.self).addOutput"),
    removeOutput: unimplemented("\(Self.self).removeOutput"),
    addInputWithNoConnections: unimplemented("\(Self.self).addInputWithNoConnections"),
    addOutputWithNoConnections: unimplemented("\(Self.self).addOutputWithNoConnections"),
    connections: unimplemented("\(Self.self).connections"),
    canAddConnection: unimplemented("\(Self.self).canAddConnection"),
    addConnection: unimplemented("\(Self.self).addConnection"),
    removeConnection: unimplemented("\(Self.self).removeConnection"),
    beginConfiguration: unimplemented("\(Self.self).beginConfiguration"),
    commitConfiguration: unimplemented("\(Self.self).commitConfiguration"),
    isRunning: unimplemented("\(Self.self).isRunning"),
    isInterrupted: unimplemented("\(Self.self).isInterrupted"),
    isMultitaskingCameraAccessSupported: unimplemented("\(Self.self).isMultitaskingCameraAccessSupported"),
    isMultitaskingCameraAccessEnabled: unimplemented("\(Self.self).isMultitaskingCameraAccessEnabled"),
    usesApplicationAudioSession: unimplemented("\(Self.self).usesApplicationAudioSession"),
    automaticallyConfiguresApplicationAudioSession: unimplemented("\(Self.self).automaticallyConfiguresApplicationAudioSession"),
    automaticallyConfiguresCaptureDeviceForWideColor: unimplemented("\(Self.self).automaticallyConfiguresCaptureDeviceForWideColor"),
    startRunning: unimplemented("\(Self.self).startRunning"),
    stopRunning: unimplemented("\(Self.self).stopRunning")
  )

  public static let noop = Self(
    canSetSessionPreset: { _ in return true },
    sessionPreset: .vga640x480,
    inputs: [],
    canAddInput: { _ in return true },
    addInput: { _ in },
    removeInput: { _ in },
    outputs: [],
    canAddOutput: { _ in return true },
    addOutput: { _ in },
    removeOutput: { _ in },
    addInputWithNoConnections: { _ in },
    addOutputWithNoConnections: { _ in },
    connections: [],
    canAddConnection: { _ in return true },
    addConnection: { _ in },
    removeConnection: { _ in },
    beginConfiguration: { },
    commitConfiguration: { },
    isRunning: false,
    isInterrupted: false,
    isMultitaskingCameraAccessSupported: true,
    isMultitaskingCameraAccessEnabled: true,
    usesApplicationAudioSession: true,
    automaticallyConfiguresApplicationAudioSession: true,
    automaticallyConfiguresCaptureDeviceForWideColor: true,
    startRunning: { },
    stopRunning: { }
  )
}
