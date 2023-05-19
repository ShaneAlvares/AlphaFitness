//
//  ForgetPasswordViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-18.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    let loginHeader : UILabel = {
        let label = UILabel()
        label.text = "Forget Password"
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
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let btnVerify: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("REQUEST VERIFICATION CODE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        // button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let textSecretCode: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Secret Code"
        textField.keyboardType = .numberPad
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
    
    
    let btnUpdatePassword: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("UPDATE PASSWORD", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        // button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
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
        view.backgroundColor = .systemBackground
        view.addSubview(loginHeader)
        view.addSubview(emailTextField)
        view.addSubview(btnVerify)
        view.addSubview(textSecretCode)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(btnUpdatePassword)
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
            btnVerify.topAnchor.constraint(equalTo:emailTextField.bottomAnchor, constant: 30),
            btnVerify.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnVerify.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btnVerify.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            textSecretCode.topAnchor.constraint(equalTo: btnVerify.bottomAnchor, constant: 30),
            textSecretCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textSecretCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textSecretCode.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: textSecretCode.bottomAnchor, constant: 30),
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
            btnUpdatePassword.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            btnUpdatePassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnUpdatePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btnUpdatePassword.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
}
