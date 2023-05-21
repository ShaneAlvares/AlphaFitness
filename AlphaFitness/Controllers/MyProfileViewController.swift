//
//  MyProfileViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//

import UIKit

class MyProfileViewController: UIViewController {

    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        
        return scrollView
    }()
    
    let contentView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        return contentView
    }()
    
    let userIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle.fill")
        return imageView
    }()
    
    
    let pgName : UILabel = {
        let label = UILabel()
        label.text = "My Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    
    let productStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 120
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
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
    
    let contactNo: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Contact Number"
        textField.keyboardType = .numberPad
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 3
        //UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let saveBtn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        //button.addTarget(self, action: #selector(gotoGenderSelection), for: .touchUpInside)
        return button
    }()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(pgName)
        
        contentView.addSubview(userIcon)
        contentView.addSubview(nameTextField)
        contentView.addSubview(ageTextField)
        contentView.addSubview(contactNo)
        contentView.addSubview(emailTextField)
        
        contentView.addSubview(saveBtn)
        
        addConstraints()
    }
    
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pgName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            pgName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
        ])
        
        NSLayoutConstraint.activate([
            userIcon.topAnchor.constraint(equalTo: pgName.bottomAnchor, constant: 40),
            userIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            userIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            userIcon.heightAnchor.constraint(equalToConstant: 80),
            userIcon.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 35),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            ageTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            ageTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            ageTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            contactNo.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 30),
            contactNo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            contactNo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            contactNo.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: contactNo.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            saveBtn.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            saveBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

