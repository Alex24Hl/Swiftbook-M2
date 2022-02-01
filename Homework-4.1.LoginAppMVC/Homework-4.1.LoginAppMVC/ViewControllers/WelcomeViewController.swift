//
//  WelcomeViewController.swift
//  Homework-4.1.LoginAppMVC
//
//  Created by Александр Холод on 01.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel?.text = "Welcome, \(name)!"
    }

}
