//
//  LoginViewController.swift
//  AuthorizationApp
//
//  Created by Denis Bokov on 04.06.2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.autocorrectionType = .no

    }


}

