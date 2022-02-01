//
//  ViewController.swift
//  Homework-4.1.LoginAppMVC
//
//  Created by Александр Холод on 31.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
//        tabBarController.viewControllers
//        let viewControllers = [WelcomeViewController(), AboutMeViewController()]
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = person.username
            }
            if let aboutMeVC = viewController as? AboutMeViewController {
                
            }
        }
    }
    
    func wrongAuthorization() {
        let alert = UIAlertController(title: "Wrong authorization",
                                      message: "Please, enter the correct username and password",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    @IBAction func loginAction() {
        if !(person.username == usernameTF.text && person.password == passwordTF.text) {
            wrongAuthorization()
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUsername() {
        let alertUsername = UIAlertController(title: "Username",
                                              message: "Yours username - \(person.username)",
                                              preferredStyle: .alert)
        alertUsername.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertUsername, animated: true)
        
    }
    
    @IBAction func forgotPassword() {
        let alertPassword = UIAlertController(title: "Password",
                                              message: "Yours password - \(person.password)",
                                              preferredStyle: .alert)
        alertPassword.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertPassword, animated: true)
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        guard let _  = unwindSegue.source as? WelcomeViewController else { return }
        usernameTF.text = ""
        passwordTF.text = ""
    }
}

