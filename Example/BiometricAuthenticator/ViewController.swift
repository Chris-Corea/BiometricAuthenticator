//
//  ViewController.swift
//  BiometricAuthenticator
//
//  Created by ccorea22@gmail.com on 11/07/2017.
//  Copyright (c) 2017 ccorea22@gmail.com. All rights reserved.
//

import UIKit
import BiometricAuthenticator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func authenticateWithBiometrics(_ sender: Any) {
        let bioAuth = BiometricAuthenticator()
        if bioAuth.isTouchIdEnabledOnDevice() || bioAuth.isFaceIdEnabledOnDevice() {
            bioAuth.authenticate(localizedReason: "Let's authenticate with biometrics!", successBlock: {
                // oh boy it worked!
            }, failureBlock: { (error) in
                if let error = error {
                    switch error {
                    default:
                        // use the LAError codes to handle the different error scenarios
                        print("error: \(error.code)")
                    }
                }
            })
        }
    }
}

