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
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = Person.getUser().fullname
            }
            else if let aboutMeVC = viewController as? AboutMeViewController {
                aboutMeVC.name = Person.getUser().name
                aboutMeVC.age = Person.getUser().age
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
        if !(user.login == usernameTF.text && user.password == passwordTF.text) {
            wrongAuthorization()
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUsername() {
        let alertUsername = UIAlertController(title: "Username",
                                              message: "Yours username - \(user.login)",
                                              preferredStyle: .alert)
        alertUsername.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertUsername, animated: true)
        
    }
    
    @IBAction func forgotPassword() {
        let alertPassword = UIAlertController(title: "Password",
                                              message: "Yours password - \(user.password)",
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

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginAction()
        }
        return true
    }
}
