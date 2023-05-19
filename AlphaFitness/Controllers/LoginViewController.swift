//
//  LoginViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-14.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginHeader : UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email Address"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        button.addTarget(self, action: #selector(gotoHome), for: .touchUpInside)
        // button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let divider : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.systemGray2
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        button.addTarget(self, action: #selector(gotoSignUp), for: .touchUpInside)
        return button
    }()
    
    
    let fogotPassword : UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.addTarget(self, action: #selector(gotoForgetPassword), for: .touchUpInside)
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giveForgotPasswordLabelAction()
        
        navigationItem.hidesBackButton = true
        
        view.backgroundColor = .systemBackground
        view.addSubview(loginHeader)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(divider)
        view.addSubview(signUpButton)
        view.addSubview(fogotPassword)
        setConstraints()
        
        
    }
    
    
    func setConstraints(){
        
        
        
        NSLayoutConstraint.activate([
            loginHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            loginHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo:loginHeader.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            fogotPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            fogotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            //fogotPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divider.bottomAnchor.constraint(equalTo: fogotPassword.bottomAnchor, constant: 20),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    func giveForgotPasswordLabelAction(){
        fogotPassword.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gotoForgetPassword))
        fogotPassword.addGestureRecognizer(tapGesture)
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
    
    @objc func gotoHome(){
        let tabNavbar = BottomNavBarController()
        let nav = UINavigationController(rootViewController: tabNavbar)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false , completion: nil)
        
//        let controller = BottomNavBarController()
//        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func gotoForgetPassword(){
        let controller = ForgetPasswordViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func gotoSignUp(){
        let controller = SignInViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
