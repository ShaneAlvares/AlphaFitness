//
//  DashboardViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-19.
//

import UIKit

import SDWebImage

class DashboardViewController: UIViewController {
    
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
    
    let greetingLabel : UILabel = {
        let label = UILabel()
        label.text = "Hi, Shane Alvares"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let greetingInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "Its your training time, Go Go!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private var progressView: CircularProgress!
    
    let dailyTargetLabel : UILabel = {
        let label = UILabel()
        label.text = "🔥 Daily Traget!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let calorieBurnedLabel : UILabel = {
        let label = UILabel()
        label.text = "Burned Calories"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let cardTarget : CardView = {
        
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .blue
        card.layer.cornerRadius = 10
        return card
    }()
    
    let cardName : UILabel = {
        let label = UILabel()
        label.text = "Activity History"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let cardNamePeriod : UILabel = {
        let label = UILabel()
        label.text = "Weekly"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let cardView : CardView = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .black
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.label.cgColor
        card.layer.cornerRadius = 10
        return card
    }()
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    let popularWorkoutLabel : UILabel = {
        let label = UILabel()
        label.text = "Popular Workouts"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let allExcersises : UILabel = {
        let label = UILabel()
        label.text = "See More"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
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
        contentView.addSubview(userIcon)
        contentView.addSubview(greetingLabel)
        contentView.addSubview(greetingInfoLabel)
        //contentView.addSubview(cardContainerView)
        
        addContentTargetCard()
        contentView.addSubview(cardTarget)
        addStackForCard()
        contentView.addSubview(cardView)
        
        contentView.addSubview(popularWorkoutLabel)
        contentView.addSubview(allExcersises)
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
            userIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            userIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            userIcon.heightAnchor.constraint(equalToConstant: 70),
            userIcon.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: userIcon.centerYAnchor, constant: -12),
            greetingLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 12),
        ])
        NSLayoutConstraint.activate([
            greetingInfoLabel.centerYAnchor.constraint(equalTo: userIcon.centerYAnchor, constant: 12),
            greetingInfoLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 12),
        ])
        
        NSLayoutConstraint.activate([
            cardTarget.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 10),
            cardTarget.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            cardTarget.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            cardTarget.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: cardTarget.bottomAnchor, constant: 5),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            cardView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            popularWorkoutLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20),
            popularWorkoutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            popularWorkoutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
        ])
        NSLayoutConstraint.activate([
            allExcersises.centerYAnchor.constraint(equalTo: popularWorkoutLabel.centerYAnchor),
            allExcersises.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
        ])
        
        
        NSLayoutConstraint.activate([
            popularWorkoutsCard.topAnchor.constraint(equalTo: popularWorkoutLabel.bottomAnchor, constant: 20),
            popularWorkoutsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            popularWorkoutsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            popularWorkoutsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -110),
        ])
        
        
        
        
        
    }
    
    func addContentTargetCard(){
        
        progressView = CircularProgress(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        
        cardTarget.addSubview(dailyTargetLabel)
        cardTarget.addSubview(calorieBurnedLabel)
        cardTarget.addSubview(progressView)
        
        progressView.setProgress(0.75)
        NSLayoutConstraint.activate([
            
            dailyTargetLabel.topAnchor.constraint(equalTo: cardTarget.topAnchor,constant: 10),
            dailyTargetLabel.leadingAnchor.constraint(equalTo: cardTarget.leadingAnchor, constant: 20),
            
            calorieBurnedLabel.topAnchor.constraint(equalTo: dailyTargetLabel.bottomAnchor,constant: 7),
            calorieBurnedLabel.leadingAnchor.constraint(equalTo: cardTarget.leadingAnchor, constant: 20),
            
            progressView.centerYAnchor.constraint(equalTo: cardTarget.centerYAnchor),
            progressView.trailingAnchor.constraint(equalTo: cardTarget.trailingAnchor, constant: -20),
            progressView.widthAnchor.constraint(equalToConstant: 40),
            progressView.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func addStackForCard(){
        
        for i in ["MON", "TUE", "WEN", "THU", "FRI", "SAT"] {
            
            let label = createLabel(with: (i))
            // Add label to the stack view
            stackView.addArrangedSubview(label)
        }
        cardView.addSubview(cardName)
        cardView.addSubview(cardNamePeriod)
        cardView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            cardName.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 15),
            cardName.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            
            cardNamePeriod.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 15),
            cardNamePeriod.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: cardName.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
    }
    
    func createLabel(with text: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        let progressViewCompleted = UIView()
        progressViewCompleted.backgroundColor = .systemGreen
        progressViewCompleted.layer.cornerRadius = 5
        
        let progressViewRemaining = UIView()
        progressViewRemaining.backgroundColor = .systemGray3
        progressViewRemaining.layer.cornerRadius = 5
        
        let labelContainer = UIView()
        labelContainer.addSubview(label)
        labelContainer.addSubview(progressViewCompleted)
        labelContainer.addSubview(progressViewRemaining)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        progressViewCompleted.translatesAutoresizingMaskIntoConstraints = false
        progressViewRemaining.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //                    Remaing Part
            
            progressViewRemaining.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 20),
            progressViewRemaining.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor),
            progressViewRemaining.widthAnchor.constraint(equalTo: labelContainer.widthAnchor, multiplier: 0.2), // Adjust the width as needed
            progressViewRemaining.heightAnchor.constraint(equalToConstant: 90),
            progressViewRemaining.bottomAnchor.constraint(equalTo: progressViewCompleted.topAnchor, constant: -10),
            
            //                    Completed Part
            
            progressViewCompleted.topAnchor.constraint(equalTo: progressViewRemaining.bottomAnchor),
            progressViewCompleted.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor),
            progressViewCompleted.widthAnchor.constraint(equalTo: labelContainer.widthAnchor, multiplier: 0.2), // Adjust the width as needed
            progressViewCompleted.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20),
            
            
            label.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant: -15),
            
        ])
        
        return labelContainer
    }
    
    func addProductToStack(){
        for i in ["Excersie 01", "Excersie 02", "Excersie 03", "Excersie 04", "Excersie 05", "Excersie 06"] {
            let exerciseLayout = createExceriseLayout(with: (i))
            productStack.addArrangedSubview(exerciseLayout)
        }
        
        popularWorkoutsCard.addSubview(productStack)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gotoViewExcersiseDetailPage))
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
        excersieCategory.text = "Body Weight"
        excersieCategory.textAlignment = .center
        excersieCategory.backgroundColor = .clear
        excersieCategory.textColor = .systemGray
        excersieCategory.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        excersieCategory.translatesAutoresizingMaskIntoConstraints = false
        
        let excersieTimePeriod = UILabel()
        excersieTimePeriod.text = "5mins - Intermediate"
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
        viewMoreBtn.addTarget(self, action: #selector(gotoViewExcersiseDetailPage), for: .touchUpInside)
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
    
    @objc func gotoViewExcersiseDetailPage(){
        let controller = SingleExcerciseViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
