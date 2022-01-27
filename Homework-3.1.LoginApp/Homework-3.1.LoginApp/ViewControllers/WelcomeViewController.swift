//
//  WelcomeViewController.swift
//  Homework-3.1.LoginApp
//
//  Created by Александр Холод on 25.01.2022.
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
