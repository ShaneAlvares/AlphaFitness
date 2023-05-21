//
//  ProfileViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//

import UIKit
import ObjectiveC

class ProfileViewController: UIViewController {
    
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
    
    let bmiLabel : UILabel = {
        let label = UILabel()
        label.text = "BMI: 22.34"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "This will provide a personalized space for users to track and manage their fitness journey."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        //label.textAlignment = .justified
        return label
    }()
    
    
    let productStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 45
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    let popularWorkoutsCard : CardView = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .clear
        return card
    }()
    
    var menus = [["name":"General Settings","icon":"gear"],["name":"Workout History","icon":"figure.highintensity.intervaltraining"],["name":"Logout","icon":"rectangle.portrait.and.arrow.right"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(pgName)
        contentView.addSubview(bmiLabel)
        contentView.addSubview(infoLabel)
        
        
        addProductToStack()
        contentView.addSubview(popularWorkoutsCard)
        
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
            infoLabel.topAnchor.constraint(equalTo: pgName.bottomAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
        ])
        
        NSLayoutConstraint.activate([
            bmiLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40),
            bmiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            bmiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
        ])
        
        NSLayoutConstraint.activate([
            popularWorkoutsCard.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 45),
            popularWorkoutsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            popularWorkoutsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            popularWorkoutsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    func addProductToStack() {
//        let gesWH = UITapGestureRecognizer(target: self, action: #selector(viewWorkoutHistory))
//        let gesVP = UITapGestureRecognizer(target: self, action: #selector(viewProfile))
//
        for (index, object) in menus.enumerated() {
            if let name = object["name"] as? String, let icon = object["icon"] as? String {
                let exerciseLayout = createExerciseLayout(with: name, tag: index, iconImg: icon, status: true)
                
                if let button = exerciseLayout.subviews.compactMap({ $0 as? UIButton }).first {
                    let gesChecking = UITapGestureRecognizer(target: self, action: #selector(check(_:)))
                    button.addGestureRecognizer(gesChecking)
                }
                
                productStack.addArrangedSubview(exerciseLayout)
            }
        }
        
        let layout = createExerciseLayout(with: "", tag: 0, iconImg: "", status: false)
        productStack.addArrangedSubview(layout)
        
        popularWorkoutsCard.addSubview(productStack)
        
        
        NSLayoutConstraint.activate([
            productStack.topAnchor.constraint(equalTo: popularWorkoutsCard.topAnchor, constant: 0),
            productStack.leadingAnchor.constraint(equalTo: popularWorkoutsCard.leadingAnchor),
            productStack.trailingAnchor.constraint(equalTo: popularWorkoutsCard.trailingAnchor),
            productStack.bottomAnchor.constraint(equalTo: popularWorkoutsCard.bottomAnchor)
        ])
    }
    
    func createExerciseLayout(with text: String, tag: Int, iconImg: String, status: Bool) -> UIView {
        let labelContainer = UIView()
        
        if status {
            let exerciseName = UILabel()
            exerciseName.text = text
            exerciseName.textAlignment = .center
            exerciseName.backgroundColor = .clear
            exerciseName.textColor = .label
            exerciseName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            exerciseName.translatesAutoresizingMaskIntoConstraints = false
            
            let icon = UIImageView()
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.layer.cornerRadius = 10
            icon.image = UIImage(systemName: iconImg)
            icon.tintColor = .label
            
            let viewMoreBtn = UIButton()
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
            let symbolImage = UIImage(systemName: "arrow.forward.circle", withConfiguration: symbolConfiguration)
            viewMoreBtn.setImage(symbolImage, for: .normal)
            viewMoreBtn.tintColor = .systemGray
            viewMoreBtn.translatesAutoresizingMaskIntoConstraints = false
            //viewMoreBtn.addTarget(self, action: Selector((functionParsed + ":")), for: .touchUpInside)
            viewMoreBtn.backgroundColor = .clear
            viewMoreBtn.isUserInteractionEnabled = true
           // viewMoreBtn.customString = "Extra detail for \(text)"
            viewMoreBtn.tag = tag
                
            
            labelContainer.addSubview(exerciseName)
            labelContainer.addSubview(icon)
            labelContainer.addSubview(viewMoreBtn)
            
            NSLayoutConstraint.activate([
                icon.topAnchor.constraint(equalTo: labelContainer.topAnchor),
                icon.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor),
                icon.widthAnchor.constraint(equalToConstant: 40),
                icon.heightAnchor.constraint(equalToConstant: 40),
                
                exerciseName.centerYAnchor.constraint(equalTo: icon.centerYAnchor, constant: 0),
                exerciseName.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
                
                viewMoreBtn.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
                viewMoreBtn.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: 0),
                viewMoreBtn.widthAnchor.constraint(equalToConstant: 40),
                viewMoreBtn.heightAnchor.constraint(equalToConstant: 40),
            ])
        }
        
        NSLayoutConstraint.activate([
            labelContainer.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        return labelContainer
    }
    
    
    @objc func check(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UIButton else {
            print ("No clicked the button")
            return
        }
        if menus[label.tag]["name"] == "General Settings"{
            viewProfile()
        }else if menus[label.tag]["name"] == "Workout History"{
            print("Work out cclick")
            viewWorkoutHistory()
        }else if menus[label.tag]["name"] == "Logout"{
            logoutUser()
        }
    }
    
    @objc func viewWorkoutHistory() {
        print("Viewing Workout History")
        let controller = WorkoutHistoryViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func viewProfile() {
        print("Viewing Profile")
//        let popupVC = MyProfileViewController()
//        popupVC.modalPresentationStyle = .fullScreen
//        present(popupVC, animated: false, completion: nil)
        
        let controller = MyProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func logoutUser() {
        print("Logout")
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
