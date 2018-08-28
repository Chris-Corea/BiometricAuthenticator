//
//  UIDeviceExtension.swift
//  BiometricAuthenticator
//
//  Created by Christopher Corea on 11/7/17.
//

internal extension UIDevice {
    
    /// Attempts to get the current device's model name.
    private func deviceSystemName() -> String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        guard let modelCode = withUnsafePointer(to: &systemInfo.machine, {
            $0.withMemoryRebound(to: CChar.self, capacity: 1, { ptr in
                String.init(validatingUTF8: ptr)
            })
        }) else { return nil };
        return modelCode
    }
    
    /**
    Rather than checking for the device's biometry type which would only return a non-none value
    if the biometric feature was enabled, the below functions check against a list of model names
    that do not support Touch ID or Face ID.
    **/
    
    /// Checks if the current device's model name is contained in a list of device names
    /// that don't support Touch ID.
    func supportsTouchId() -> Bool {
        let invalidModels = [
            "iPhone4,1",                // iPhone 4S
            "iPhone5,1", "iPhone5,2",   // iPhone 5
            "iPhone5,3", "iPhone5,4",   // iPhone 5C
            "iPhone10,3", "iPhone10,6"  // iPhone X (CDMA and GSM)
        ]
        if let modelName = deviceSystemName() {
            return !invalidModels.contains(modelName)
        }
        return false
    }
    
    /// Checks if the current device's model name is contained in a list of device names
    /// that don't support Face ID.
    func supportsFaceId() -> Bool {let invalidModels = [
        "x86_64",                   // Simulator
        "iPhone4,1",                // iPhone 4S
        "iPhone5,1", "iPhone5,2",   // iPhone 5
        "iPhone5,3", "iPhone5,4",   // iPhone 5C
        "iPhone6,1", "iPhone6,2",   // iPhone 5S
        "iPhone7,2", "iPhone7,1",   // iPhone 6, 6 Plus
        "iPhone8,1", "iPhone8,2",   // iPhone 6s, 6s Plus
        "iPhone8,4",                // iPhone SE
        "iPhone9,1", "iPhone9,3",   // iPhone 7
        "iPhone9,2", "iPhone9,4",   // iPhone 7 Plus
        "iPhone10,1", "iPhone10,4", // iPhone 8
        "iPhone10,2", "iPhone10,5" // iPhone 8 Plus
        ]
        if let modelName = deviceSystemName() {
            return !invalidModels.contains(modelName)
        }
        return false
    }
}
