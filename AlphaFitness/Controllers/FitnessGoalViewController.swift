//
//  FitnessGoalViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-17.
//

import UIKit

class FitnessGoalViewController: UIViewController {
    
    let pageLabel : UILabel = {
       let label = UILabel()
        label.text = "2 of 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let questionLabel : UILabel = {
       let label = UILabel()
        label.text = "What is your fitness goal?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let infoLabel : UILabel = {
       let label = UILabel()
        label.text = "This helps us tailor our approach, create personalized plans, and provide the necessary motivation and direction to achieve desired results."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    let dividerView : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.gray
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    let dividerVerticalView : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.gray
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    
    
    let backButton : UIButton = {
        let backArr = UIImage(systemName: "arrow.backward")
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(backArr, for: .normal)
        btn.tintColor = .gray
        return btn
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CONTINOUE", for: .normal)
        btn.setTitleShadowColor(UIColor.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        btn.setTitleColor(.systemBlue, for: .normal)
      return btn
    }()
    
    let btnWeightLoss : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Weight loss", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let btnMuscleGain : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Muscle gain", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    let btnCardiovascular : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Improved cardiovascular fitness", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pageLabel)
        view.addSubview(questionLabel)
        view.addSubview(infoLabel)
        
        view.addSubview(btnWeightLoss)
        view.addSubview(btnMuscleGain)
        view.addSubview(btnCardiovascular)
        
        
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
            btnWeightLoss.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnWeightLoss.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 80),
            btnWeightLoss.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnWeightLoss.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnWeightLoss.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            btnMuscleGain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnMuscleGain.topAnchor.constraint(equalTo: btnWeightLoss.bottomAnchor, constant: 20),
            btnMuscleGain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnMuscleGain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnMuscleGain.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            btnCardiovascular.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnCardiovascular.topAnchor.constraint(equalTo: btnMuscleGain.bottomAnchor, constant: 20),
            btnCardiovascular.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            btnCardiovascular.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            btnCardiovascular.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Deselect all buttons
//        for button in [btnWeightLoss, btnMuscleGain, btnCardiovascular] {
//            button.isSelected = false
//            button.backgroundColor = .white
//            button.layer.sublayers?.removeAll { $0 is CAGradientLayer }
//        }
//        
//        // Select the tapped button and apply the gradient effect
//        sender.isSelected = true
//        sender.setTitleColor(UIColor.white, for: .selected)
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.systemBlue.cgColor]
//        gradientLayer.locations = [0, 1]
//        gradientLayer.frame = sender.bounds
//        gradientLayer.cornerRadius = 10
//        
//        sender.layer.insertSublayer(gradientLayer, at: 0)
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
