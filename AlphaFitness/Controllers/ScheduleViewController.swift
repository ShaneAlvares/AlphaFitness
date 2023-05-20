//
//  ScheduleViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-20.
//

import UIKit

class ScheduleViewController: UIViewController {
    
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
        label.text = "All Schedules"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor =  .black
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setTitleColor(.white, for: .normal)
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(openPopup), for: .touchUpInside)
        return button
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "This will help you categorise your workouts as you wish and keep them seprately and scheduled."
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
        stack.spacing = 80
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(pgName)
        contentView.addSubview(addButton)
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
            addButton.centerYAnchor.constraint(equalTo: pgName.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            addButton.widthAnchor.constraint(equalToConstant: 35),
            addButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: pgName.bottomAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
        ])
        
        NSLayoutConstraint.activate([
            popularWorkoutsCard.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            popularWorkoutsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            popularWorkoutsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            popularWorkoutsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    
    func addProductToStack(){
        for i in ["Mon - LEGS", "Tue - BICEPTS", "Wens - ABS", "Thu - TRICEPTS", "Fri - SHOULDERS", "Sat - CHEST"] {
            let exerciseLayout = createExceriseLayout(with: (i))
            productStack.addArrangedSubview(exerciseLayout)
        }
        
        popularWorkoutsCard.addSubview(productStack)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gotoViewDetailSchedule))
        popularWorkoutsCard.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            productStack.topAnchor.constraint(equalTo: popularWorkoutsCard.topAnchor, constant: 0),
            productStack.leadingAnchor.constraint(equalTo: popularWorkoutsCard.leadingAnchor),
            productStack.trailingAnchor.constraint(equalTo: popularWorkoutsCard.trailingAnchor),
            productStack.bottomAnchor.constraint(equalTo: popularWorkoutsCard.bottomAnchor)
        ])
    }
    
    func createExceriseLayout(with text: String) -> UIView {
        let excersieName = UILabel()
        excersieName.text = text
        excersieName.textAlignment = .center
        excersieName.backgroundColor = .clear
        excersieName.textColor = .label
        excersieName.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        excersieName.translatesAutoresizingMaskIntoConstraints = false
        
        let excersieDay = UILabel()
        excersieDay.text = "Monday"
        excersieDay.textAlignment = .center
        excersieDay.backgroundColor = .clear
        excersieDay.textColor = .systemGray
        excersieDay.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        excersieDay.translatesAutoresizingMaskIntoConstraints = false
        
        let excersieTimePeriod = UILabel()
        excersieTimePeriod.text = "05:30 PM"
        excersieTimePeriod.textAlignment = .center
        excersieTimePeriod.backgroundColor = .clear
        excersieTimePeriod.textColor = .systemGray
        excersieTimePeriod.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        excersieTimePeriod.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.layer.cornerRadius = 10
        icon.image = UIImage(systemName: "calendar.circle")
        icon.tintColor = .label
        
        
        let viewMoreBtn = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        let symbolImage = UIImage(systemName: "arrow.forward.circle", withConfiguration: symbolConfiguration)
        viewMoreBtn.setImage(symbolImage, for: .normal)
        //viewMoreBtn.setImage(UIImage(systemName: "arrow.forward.circle"), for: .normal)
        viewMoreBtn.tintColor =  .systemGray
        viewMoreBtn.translatesAutoresizingMaskIntoConstraints = false
        viewMoreBtn.addTarget(self, action: #selector(gotoViewDetailSchedule), for: .touchUpInside)
        viewMoreBtn.backgroundColor = .clear
        
        
        let labelContainer = UIView()
        
        labelContainer.addSubview(excersieName)
        labelContainer.addSubview(excersieDay)
        labelContainer.addSubview(excersieTimePeriod)
        labelContainer.addSubview(icon)
        labelContainer.addSubview(viewMoreBtn)
        
        NSLayoutConstraint.activate([
            
            icon.topAnchor.constraint(equalTo: labelContainer.topAnchor),
            icon.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.heightAnchor.constraint(equalToConstant: 60),
            
            excersieDay.centerYAnchor.constraint(equalTo: icon.centerYAnchor,constant: -13),
            excersieDay.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            
            excersieTimePeriod.topAnchor.constraint(equalTo: excersieDay.topAnchor),
            excersieTimePeriod.leadingAnchor.constraint(equalTo: excersieDay.trailingAnchor, constant: 5),
            
            excersieName.centerYAnchor.constraint(equalTo: icon.centerYAnchor,constant: 10),
            excersieName.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            
            viewMoreBtn.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            viewMoreBtn.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor),
            viewMoreBtn.heightAnchor.constraint(equalToConstant: 40),
            viewMoreBtn.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        return labelContainer
    }
    
    @objc func openPopup(){
        let popupVC = PopCreateScheduleViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        present(popupVC, animated: false, completion: nil)
    }
    
    
    @objc func gotoViewDetailSchedule(){
        let controller = DetailScheduleViewController()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
