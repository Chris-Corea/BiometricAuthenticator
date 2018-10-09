//
//  ViewController.swift
//  BiometricAuthenticator
//
//  Created by ccorea22@gmail.com on 11/07/2017.
//  Copyright (c) 2017 ccorea22@gmail.com. All rights reserved.
//

import UIKit
import BiometricAuthenticator
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var authConfirmationLabel: UILabel!
    
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
            bioAuth.authenticateWithBiometrics(localizedReason: "Let's authenticate with biometrics!", successBlock: {
                DispatchQueue.main.async {
                    self.authConfirmationLabel.alpha = 1
                    UIView.animate(withDuration: 1.25, animations: {
                        self.authConfirmationLabel.alpha = 0
                    })
                }
            }, failureBlock: { (error) in
                if let error = error {
                    switch error.code {
                    case .appCancel:
                        print("The app cancelled the prompt")
                    case .authenticationFailed:
                        print("The provided finger print or face did not match the saved credential")
                    default:
                        // use the LAError codes to handle the different error scenarios
                        print("error: \(error.code)")
                    }
                }
            })
        }
    }
}

