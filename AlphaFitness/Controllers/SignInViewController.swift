//
//  SignInViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-18.
//

import UIKit

class SignInViewController: UIViewController {
    
    let loginHeader : UILabel = {
        let label = UILabel()
        label.text = "SIGN UP"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Full Name"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Age"
        textField.keyboardType = .numberPad
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email Address"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
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
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm Password"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        button.addTarget(self, action: #selector(gotoGenderSelection), for: .touchUpInside)
        return button
    }()
    
    let divider : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.systemGray2
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOG IN", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        button.addTarget(self, action: #selector(gotoLogin), for: .touchUpInside)
        return button
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
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        view.addSubview(loginHeader)
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(signUpButton)
        view.addSubview(divider)
        view.addSubview(loginButton)
        setConstraints()
    }
    
    
    func setConstraints(){
        
        
        
        NSLayoutConstraint.activate([
            loginHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            loginHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo:loginHeader.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo:nameTextField.bottomAnchor, constant: 30),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            ageTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo:ageTextField.bottomAnchor, constant: 30),
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
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
        
        
        NSLayoutConstraint.activate([
            divider.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        
        
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
    
    @objc func gotoLogin(){
        let controller = LoginViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func gotoGenderSelection(){
        let controller = GenderSelectionViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

