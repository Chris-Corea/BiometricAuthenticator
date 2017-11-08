//
//  BiometricAuthenticator.swift
//  BiometricAuthenticator
//
//  Created by Christopher Corea on 11/7/17.
//

import Foundation
import LocalAuthentication

public typealias BASuccessBlock = (() -> Void)?
public typealias BAFailureBlock = ((_ error: LAError?) -> Void)?

public class BiometricAuthenticator {
    
    public init() {}
    
    public func isTouchIdSupportedOnDevice() -> Bool {
        return UIDevice.current.supportsTouchId()
    }
    
    public func isTouchIdEnabledOnDevice() -> Bool {
        let context = LAContext()
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) && isTouchIdSupportedOnDevice()
    }
    
    public func isFaceIdSupportedOnDevice() -> Bool {
        return UIDevice.current.supportsFaceId()
    }
    
    public func isFaceIdEnabledOnDevice() -> Bool {
        let context = LAContext()
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) && isFaceIdSupportedOnDevice()
    }
    
    public func authenticate(localizedReason: String?, successBlock: BASuccessBlock, failureBlock: BAFailureBlock) {
        let context = LAContext()
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason ?? "Use Biometrics!") { (success, error) in
            if success {
                successBlock?()
            } else {
                guard let error = error as? LAError else {
                    failureBlock?(nil)
                    return
                }
                failureBlock?(error)
            }
        }
    }
    
}
