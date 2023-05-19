//
//  FitnessLevelViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-15.
//

import UIKit

class FitnessLevelViewController: UIViewController {
    let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "2 of 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray2
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.text = "What is your expert level?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "This is used to maximize your potential and achieve your fitness goals with personalized guidance and advanced features."
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
        btn.addTarget(self, action: #selector(gotoGenderSelection), for: .touchUpInside)
        return btn
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CONTINOUE", for: .normal)
        btn.setTitleShadowColor(UIColor.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(gotoGoalSelection), for: .touchUpInside)
        return btn
    }()
    
    let btnBeginer : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Beginner", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.label.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let btnIntermediate : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Intermediate", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.label.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let btnAdvance : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Advanced", for: .normal)
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
        
        view.addSubview(btnBeginer)
        view.addSubview(btnIntermediate)
        view.addSubview(btnAdvance)
        
        
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
            btnBeginer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnBeginer.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 80),
            btnBeginer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnBeginer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnBeginer.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            btnIntermediate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnIntermediate.topAnchor.constraint(equalTo: btnBeginer.bottomAnchor, constant: 20),
            btnIntermediate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnIntermediate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnIntermediate.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            btnAdvance.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnAdvance.topAnchor.constraint(equalTo: btnIntermediate.bottomAnchor, constant: 20),
            btnAdvance.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnAdvance.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnAdvance.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Deselect all buttons
        for button in [btnBeginer, btnIntermediate, btnAdvance] {
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
    
    @objc func gotoGoalSelection(){
        let controller = FitnessGoalViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func gotoGenderSelection(){
        let controller = GenderSelectionViewController()
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
