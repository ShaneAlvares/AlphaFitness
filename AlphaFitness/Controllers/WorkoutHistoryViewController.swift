//
//  WorkoutHistoryViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//

import UIKit

class WorkoutHistoryViewController: UIViewController  {
    
    let datePicker : UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
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
        label.text = "Workout History"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    let data = ["Option 1", "Option 2", "Option 3","Option 1", "Option 2", "Option 3"]
    
   
    
    let productStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 120
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
        
        contentView.addSubview(datePicker)
        
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
            datePicker.topAnchor.constraint(equalTo: pgName.bottomAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            //datePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        NSLayoutConstraint.activate([
            popularWorkoutsCard.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            popularWorkoutsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            popularWorkoutsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            popularWorkoutsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    
    func addProductToStack(){
        for i in ["Excersie 01", "Excersie 02", "Excersie 03", "Excersie 04", "Excersie 05", "Excersie 06"] {
            let exerciseLayout = createExceriseLayout(with: (i))
            productStack.addArrangedSubview(exerciseLayout)
        }
        
        popularWorkoutsCard.addSubview(productStack)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gotoSingleExcerise))
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
        
        let excersieCategory = UILabel()
        excersieCategory.text = "Date: 05/13/2024"
        excersieCategory.textAlignment = .center
        excersieCategory.backgroundColor = .clear
        excersieCategory.textColor = .systemGray
        excersieCategory.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        excersieCategory.translatesAutoresizingMaskIntoConstraints = false
        
        let excersieTimePeriod = UILabel()
        excersieTimePeriod.text = "Time: 15mins"
        excersieTimePeriod.textAlignment = .center
        excersieTimePeriod.backgroundColor = .clear
        excersieTimePeriod.textColor = .systemGray
        excersieTimePeriod.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        excersieTimePeriod.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.layer.cornerRadius = 10
        icon.sd_setImage(with: URL(string: "https://gymvisual.com/img/p/2/7/0/1/4/27014.gif"), placeholderImage: nil, options: [], completed: nil)
        icon.layer.cornerRadius = 10
        icon.layer.shadowColor = UIColor.black.cgColor
        icon.layer.shadowOpacity = 0.5
        icon.layer.shadowOffset = CGSize(width: 0, height: 2)
        icon.layer.shadowRadius = 10
        icon.layer.borderColor = UIColor.gray.cgColor
        icon.layer.borderWidth = 2
        
//        let viewMoreBtn = UIImageView()
//        viewMoreBtn.contentMode = .scaleAspectFit
//        viewMoreBtn.clipsToBounds = true
//        viewMoreBtn.tintColor = .systemGray
//        viewMoreBtn.translatesAutoresizingMaskIntoConstraints = false
//        viewMoreBtn.image = UIImage(systemName: "arrow.forward.circle")
        
        let viewMoreBtn = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        let symbolImage = UIImage(systemName: "arrow.forward.circle", withConfiguration: symbolConfiguration)
        viewMoreBtn.setImage(symbolImage, for: .normal)
        //viewMoreBtn.setImage(UIImage(systemName: "arrow.forward.circle"), for: .normal)
        viewMoreBtn.tintColor =  .systemGray
        viewMoreBtn.translatesAutoresizingMaskIntoConstraints = false
        viewMoreBtn.addTarget(self, action: #selector(gotoSingleExcerise), for: .touchUpInside)
        viewMoreBtn.backgroundColor = .clear
        
        
        
        let labelContainer = UIView()
        
        labelContainer.addSubview(excersieName)
        labelContainer.addSubview(excersieCategory)
        labelContainer.addSubview(excersieTimePeriod)
        labelContainer.addSubview(icon)
        labelContainer.addSubview(viewMoreBtn)
        
        
        
        NSLayoutConstraint.activate([
            
            icon.topAnchor.constraint(equalTo: labelContainer.topAnchor),
            icon.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 110),
            icon.heightAnchor.constraint(equalToConstant: 110),
            
            excersieCategory.topAnchor.constraint(equalTo: icon.topAnchor, constant: 15),
            excersieCategory.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            
            excersieName.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            excersieName.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            
            excersieTimePeriod.bottomAnchor.constraint(equalTo: icon.bottomAnchor, constant: -15),
            excersieTimePeriod.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            
            viewMoreBtn.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            viewMoreBtn.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor),
            viewMoreBtn.heightAnchor.constraint(equalToConstant: 30),
            viewMoreBtn.widthAnchor.constraint(equalToConstant: 30)
            
        ])
        
        return labelContainer
    }
    
    
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter.string(from: sender.date)
        
        print("Selected Date: \(selectedDate)")
    }
    
    @objc func gotoSingleExcerise(_ sender: UIDatePicker) {
        let controller = SingleExcerciseViewController()
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
