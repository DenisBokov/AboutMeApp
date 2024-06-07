//
//  AboutMeViewController.swift
//  AuthorizationApp
//
//  Created by Denis Bokov on 05.06.2024.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var greeting: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text = "Weclcom, \(greeting ?? "")"
    }
}
