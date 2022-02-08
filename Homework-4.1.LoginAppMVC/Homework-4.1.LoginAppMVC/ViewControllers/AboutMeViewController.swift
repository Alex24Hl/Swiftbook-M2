//
//  AboutMeViewController.swift
//  Homework-4.1.LoginAppMVC
//
//  Created by Александр Холод on 01.02.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var name = ""
    var age = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = name
        ageLabel.text = "Age: \(age)"
    }

}
