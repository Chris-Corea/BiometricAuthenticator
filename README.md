# BiometricAuthenticator

[![CI Status](http://img.shields.io/travis/Chris-Corea/BiometricAuthenticator.svg?style=flat)](https://travis-ci.org/Chris-Corea/BiometricAuthenticator)
[![Version](https://img.shields.io/cocoapods/v/BiometricAuthenticator.svg?style=flat)](http://cocoapods.org/pods/BiometricAuthenticator)
[![License](https://img.shields.io/cocoapods/l/BiometricAuthenticator.svg?style=flat)](http://cocoapods.org/pods/BiometricAuthenticator)
[![Platform](https://img.shields.io/cocoapods/p/BiometricAuthenticator.svg?style=flat)](http://cocoapods.org/pods/BiometricAuthenticator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
import BiometricAuthenticator

if BiometricAuthenticator.canAuthenticateWithBiometrics() {
    BiometricAuthenticator.authenticate("Hooray for fancy authentication!") { (success, error) in
        if success {
            // hooray for successful authentication!
        } else {
            switch error {
            case .authFailed:
                // either the face or finger print didn't match what iOS has stored
                ...
            default:
                ...
            }
        }
    }
}
```

The BiometricAuthenticator can also determine if the current device has biometric capabilities and whether or not the biometric feature has been enabled.

```swift
import BiometricAuthenticator

if BiometricAuthenticator.isTouchIdSupportedOnDevice() { // check if the feature exists on the device
    // check if the feature is enabled
    if BiometricAuthenticator.isTouchIdEnabledOnDevice() {
        // Hooray! We can authenticate using Touch ID!
    }
}

if BiometricAuthenticator.isFaceIdSupportedOnDevice() { // check if the feature exists on the device
    // check if the feature is enabled
    if BiometricAuthenticator.isFaceIdEnabledOnDevice() {
        // Hooray! We can authenticate using Face ID!
    }
}
```

Or if you'd rather just check for feature enablement:

```swift
import BiometricAuthenticator

if BiometricAuthenticator.isTouchIdEnabledOnDevice() {
    ...
}

if BiometricAuthenticator.isFaceIdEnabledOnDevice() {
    ...
}
```

## Requirements

Xcode 8+, iOS 9.0+

## Installation

BiometricAuthenticator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BiometricAuthenticator'
```

## Author

Chris Corea, ccorea22@gmail.com

## License

BiometricAuthenticator is available under the MIT license. See the [LICENSE](https://github.com/Chris-Corea/BiometricAuthenticator/blob/master/LICENSE) file for more info.
