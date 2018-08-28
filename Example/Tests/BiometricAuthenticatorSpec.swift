//
//  BiometricAuthenticatorSpec.swift
//  BiometricAuthenticator_Tests
//
//  Created by Christopher Corea on 11/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import BiometricAuthenticator

class BiometricAuthenticatorSpec: QuickSpec {
    override func spec() {
        describe("A simulator") {
            let sut = BiometricAuthenticator()
            
            it("should support Touch ID") {
                var res = sut.isTouchIdSupportedOnDevice()
                expect(res) == true
            }
            
            it("should not support Face ID") {
                var res = sut.isFaceIdSupportedOnDevice()
                expect(res) == false
            }
        }
    }
}
