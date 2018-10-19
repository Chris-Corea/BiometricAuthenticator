# BiometricAuthenticator

[![CI Status](http://img.shields.io/travis/Chris-Corea/BiometricAuthenticator.svg?style=flat)](https://travis-ci.org/Chris-Corea/BiometricAuthenticator)
[![Version](https://img.shields.io/cocoapods/v/BiometricAuthenticator.svg?style=flat)](http://cocoapods.org/pods/BiometricAuthenticator)
[![License](https://img.shields.io/cocoapods/l/BiometricAuthenticator.svg?style=flat)](http://cocoapods.org/pods/BiometricAuthenticator)
[![Platform](https://img.shields.io/cocoapods/p/BiometricAuthenticator.svg?style=flat)](http://cocoapods.org/pods/BiometricAuthenticator)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

First things first, any application that plans on authenticating with Face ID must inclue the `NSFaceIDUsageDescription` key in the app's Info.plist file. From within in the plist editor in xcode, add a new row and start typing out the following:  `Privacy - Face ID Usage Description` (Xcode should autocomplete) followed by your usage string.

Invoking the authentication prompt can be as easy as:

```swift
import BiometricAuthenticator

let bioAuth = BiometricAuthenticator()

if bioAuth.isTouchIdEnabledOnDevice() || bioAuth.isFaceIdEnabledOnDevice() {
    bioAuth.authenticate(localizedReason: "Let's authenticate with biometrics!", successBlock: {
        // oh boy it worked!
    }, failureBlock: { (error) in
        if let error = error {
            switch error {
            default:
            // use the LAError code to handle the different error scenarios
            print("error: \(error.code)")
            }
        }
    })
}
```

The BiometricAuthenticator can also determine if the current device has biometric capabilities and whether or not the biometric feature has been enabled.

```swift
import BiometricAuthenticator

let bioAuth = BiometricAuthenticator()

// check if the feature exists on the device
if bioAuth.isTouchIdSupportedOnDevice() {
    // check if the feature is enabled
    if bioAuth.isTouchIdEnabledOnDevice() {
        // Hooray! We can authenticate using Touch ID!
    }
}

// check if the feature exists on the device
if bioAuth.isFaceIdSupportedOnDevice() {
    // check if the feature is enabled
    if bioAuth.isFaceIdEnabledOnDevice() {
        // Hooray! We can authenticate using Face ID!
    }
}
```

Or if you'd rather just check for feature enablement directly:

```swift
import BiometricAuthenticator

let bioAuth = BiometricAuthenticator()

if bioAuth.isTouchIdEnabledOnDevice() {
    ...
}

if bioAuth.isFaceIdEnabledOnDevice() {
    ...
}
```

### Handling Authentication Errors

The BiometricAuthenticator relies on the Local Authentication module's provided
error codes. The relevant error codes are below with a bit about what they cover.

`appCancel` - The application cancelled the biometric prompt

`authenticationFailed` - The provided fingerprint or face was not recognized by iOS

`biometryLockout` - Authentication could not continue because the user has been locked
out of biometric authentication, due to failing authentication too many times.

`biometryNotAvailable` - Authentication could not start because the device does not support
biometric authentication.

`biometryNotEnrolled` - Authentication could not start because the user has not enrolled in
biometric authentication.

`passcodeNotSet` - Authentication could not start because the passcode is not set on the device.

`systemCancel` - Authentication was canceled by the system (can be caused by another application
taking foreground while the authentication dialog was up)

`userCancel` - User cancelled by clicking the cancel option in the authentication dialog.

`userFallback` - Authentication was canceled because the user tapped the fallback button in the
authentication dialog, but no fallback is available for the authentication policy.

## Requirements

Xcode 8+, iOS 9.0+

## Installation

BiometricAuthenticator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BiometricAuthenticator'
```

For versions < Swift 4.2: 
```ruby
pod 'BiometricAuthenticator', '~> 1.3.0'
```

## Author

Chris Corea, ccorea22@gmail.com

## License

BiometricAuthenticator is available under the MIT license. See the [LICENSE](https://github.com/Chris-Corea/BiometricAuthenticator/blob/master/LICENSE) file for more info.
