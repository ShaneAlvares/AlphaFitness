//
//  LoginViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-14.
//

import UIKit

class LoginViewController: UIViewController {
    
    let appLogo : UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(named: "gymMen")
        return logo
    }()
    
    let loginHeader : UILabel = {
        let label = UILabel()
        label.text = "Hey, \nWelcome back!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let emailLabel : UILabel = {
       let label = UILabel()
        label.text = "Email Address"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your Email Address"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 6
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let passLabel : UILabel = {
       let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your Password"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 6
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
       // button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let fogotPassword : UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    let createAccount : UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .right
        return label
    }()
    
    let signUpLabel : UILabel = {
        let label = UILabel()
        label.text = "Sign up"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    
    
//    let divider : UIView = {
//        let lineView = UIView(frame: CGRect(x: 10, y: 20, width: 100, height: 10))
//        lineView.layer.borderWidth = 1.0
//        lineView.layer.borderColor = UIColor.black.cgColor
//
//        return lineView
//    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(appLogo)
        view.addSubview(loginHeader)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(fogotPassword)
        view.addSubview(createAccount)
        view.addSubview(signUpLabel)
//        view.addSubview(divider)
        setConstraints()
        //addToSubView()
        //addConstraints()
        
        
    }
    
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            appLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            appLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            appLogo.heightAnchor.constraint(equalToConstant: 120),
            appLogo.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            loginHeader.centerYAnchor.constraint(equalTo: appLogo.centerYAnchor),
            loginHeader.leadingAnchor.constraint(equalTo: appLogo.trailingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: appLogo.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            passLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            fogotPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            fogotPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            fogotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            //fogotPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            createAccount.topAnchor.constraint(equalTo: fogotPassword.bottomAnchor, constant: 30),
            createAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signUpLabel.topAnchor.constraint(equalTo: fogotPassword.bottomAnchor, constant: 30),
            signUpLabel.leadingAnchor.constraint(equalTo: createAccount.trailingAnchor, constant: 5),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            //fogotPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
//            signUpLabel.topAnchor.constraint(equalTo: fogotPassword.bottomAnchor, constant: 30),
//            signUpLabel.leadingAnchor.constraint(equalTo: createAccount.trailingAnchor, constant: 5),
//            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            //fogotPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
//        NSLayoutConstraint.activate([
//            divider.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
//            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            divider.heightAnchor.constraint(equalToConstant: 20)
//        ])
        
        
    }
    
    
    
    @objc func loginButtonTapped() {
        if emailTextField.text == "" || passwordTextField.text == "" {
            errorLabel.text = "Please enter"
            errorLabel.isHidden = false
            return
        }
        if emailTextField.text == "example@email.com" && passwordTextField.text == "password" {
            // Successful login
            // You can navigate to the next screen here
        } else {
            // Invalid email or password
            errorLabel.text = "Invalid email or password"
            errorLabel.isHidden = false
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Dismiss the keyboard when the user taps outside of the text fields
        view.endEditing(true)
    }
}
