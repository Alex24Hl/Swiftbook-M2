//
//  ViewController.swift
//  Homework-3.1.LoginApp
//
//  Created by Александр Холод on 25.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let username = "Alex"
    private let password = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showWelcomeVC" else { return }
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = username
    }
    
    func wrongAuthorization() {
        let alert = UIAlertController(title: "Wrong authorization",
                                      message: "Please, enter the correct username and password",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    @IBAction func loginAction() {
        if username == usernameTF.text && password == passwordTF.text {
        } else {
            wrongAuthorization()
        }
    }
    
    @IBAction func forgotUsername() {
        let alertUsername = UIAlertController(title: "Username",
                                              message: "Yours username - \(username)",
                                              preferredStyle: .alert)
        alertUsername.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertUsername, animated: true)
    }
    
    @IBAction func forgotPassword() {
        let alertPassword = UIAlertController(title: "Password",
                                              message: "Yours password - \(password)",
                                              preferredStyle: .alert)
        alertPassword.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertPassword, animated: true)
    }
}
