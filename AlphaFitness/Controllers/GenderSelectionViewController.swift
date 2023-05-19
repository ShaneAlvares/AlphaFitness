//
//  GenderSelectionViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-18.
//

import UIKit

class GenderSelectionViewController:UIViewController {
    let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "1 of 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray2
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.text = "What is your gender?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "This is important for tailoring fitness programs and recommendations to account for physiological differences and specific needs between males and females."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray3
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    let dividerView : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.systemGray2
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    let dividerVerticalView : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.systemGray2
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    
    
    let backButton : UIButton = {
        let backArr = UIImage(systemName: "arrow.backward")
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(backArr, for: .normal)
        btn.tintColor = .systemGray2
        btn.addTarget(self, action: #selector(gotoSignIn), for: .touchUpInside)
        return btn
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CONTINOUE", for: .normal)
        btn.setTitleShadowColor(UIColor.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(gotoFitLevel), for: .touchUpInside)
        return btn
    }()
    
    let btnMale : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Male", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.label.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let btnFemale : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Female", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.label.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        view.addSubview(pageLabel)
        view.addSubview(questionLabel)
        view.addSubview(infoLabel)
        
        view.addSubview(btnMale)
        view.addSubview(btnFemale)
        
        view.addSubview(dividerView)
        view.addSubview(dividerVerticalView)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        addContraints()
        // Do any additional setup after loading the view.
    }
    
    func addContraints(){
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 20),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            dividerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            dividerVerticalView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20),
            dividerVerticalView.heightAnchor.constraint(equalToConstant: 40),
            dividerVerticalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            dividerVerticalView.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            dividerVerticalView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20),
            dividerVerticalView.heightAnchor.constraint(equalToConstant: 40),
            dividerVerticalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            dividerVerticalView.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: dividerVerticalView.centerYAnchor),
            backButton.trailingAnchor.constraint(equalTo: dividerVerticalView.leadingAnchor, constant: -25),
        ])
        
        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: dividerVerticalView.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: dividerVerticalView.trailingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
        
        NSLayoutConstraint.activate([
            //btnMale.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnMale.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 80),
            btnMale.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnMale.trailingAnchor.constraint(equalTo: btnFemale.leadingAnchor, constant: -25),
            btnMale.heightAnchor.constraint(equalToConstant: 70),
            btnMale.widthAnchor.constraint(equalTo: btnFemale.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //btnFemale.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnFemale.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 80),
            btnFemale.leadingAnchor.constraint(equalTo: btnMale.trailingAnchor, constant: 25),
            btnFemale.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnFemale.heightAnchor.constraint(equalToConstant: 70),
            btnFemale.widthAnchor.constraint(equalTo: btnMale.widthAnchor)
        ])
        
        
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Deselect all buttons
        for button in [btnMale, btnFemale] {
            button.isSelected = false
            button.backgroundColor = .white
            button.layer.sublayers?.removeAll { $0 is CAGradientLayer }
        }
        
        // Select the tapped button and apply the gradient effect
        sender.isSelected = true
        sender.setTitleColor(UIColor.white, for: .selected)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = sender.bounds
        gradientLayer.cornerRadius = 10
        
        sender.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc func gotoFitLevel(){
        let controller = FitnessLevelViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func gotoSignIn(){
        let controller = SignInViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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
