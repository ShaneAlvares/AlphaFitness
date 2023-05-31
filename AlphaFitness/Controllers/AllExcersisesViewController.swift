//
//  AllExcersisesViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-20.
//

import UIKit

class AllExcersisesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
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
        label.text = "Search Exercise"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let searchText : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Seach for Exercise"
        textField.layer.backgroundColor = UIColor.systemFill.cgColor
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20));
        textField.leftViewMode = .always;
        return textField
    }()
    
    let searchButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor =  .black
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setTitleColor(.white, for: .normal)
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    
    let resultsLabel: UILabel = {
        let label = UILabel()
        label.text = "Results: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let data = ["Option 1", "Option 2", "Option 3","Option 1", "Option 2", "Option 3"]
    
    let dropdownButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select a category", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.layer.cornerRadius = 10
        pickerView.layer.borderColor = UIColor.systemGray2.cgColor
        pickerView.layer.borderWidth = 1
        return pickerView
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
        
        contentView.addSubview(pgName)
        contentView.addSubview(searchText)
        contentView.addSubview(searchButton)
        contentView.addSubview(resultsLabel)
        
        setUpPicker()
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
            searchText.topAnchor.constraint(equalTo: pgName.bottomAnchor, constant: 10),
            searchText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            searchText.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchText.topAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchText.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchButton.heightAnchor.constraint(equalTo: searchText.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            resultsLabel.topAnchor.constraint(equalTo: searchText.bottomAnchor, constant: 20),
            resultsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
        ])
        
        NSLayoutConstraint.activate([
            dropdownButton.topAnchor.constraint(equalTo: resultsLabel.topAnchor),
            dropdownButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            dropdownButton.widthAnchor.constraint(equalToConstant: 150),
            dropdownButton.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 5),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            pickerView.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            popularWorkoutsCard.topAnchor.constraint(equalTo: resultsLabel.bottomAnchor, constant: 20),
            popularWorkoutsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            popularWorkoutsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            popularWorkoutsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func setUpPicker(){
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        view.addSubview(pickerView)
        view.addSubview(dropdownButton)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addProductToStack(){
        for i in ["Push-ups", "Squats", "Lunges", "Plank", "Mountain climbers", "Burpees", "Jumping jacks","Bicycle crunches","Deadlifts","High knees"] {
            let exerciseLayout = createExceriseLayout(with: (i))
            productStack.addArrangedSubview(exerciseLayout)
        }
        
        popularWorkoutsCard.addSubview(productStack)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openPopup))
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
        viewMoreBtn.addTarget(self, action: #selector(openPopup), for: .touchUpInside)
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
    
    
    @objc func dropdownButtonTapped() {
        pickerView.isHidden = !pickerView.isHidden
    }
    
    // MARK: - UIPickerViewDelegate and UIPickerViewDataSource methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // We only have one component in this example
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dropdownButton.setTitle(data[row], for: .normal)
        pickerView.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let option = data[row]
        let color = UIColor.black // Replace with your desired font color
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: UIFont.systemFont(ofSize: 14) // Replace with your desired font size
        ]
        
        return NSAttributedString(string: option, attributes: attributes)
    }
    
    @objc func openPopup(){
        print(self.view.bounds.height)
//        let popupVC = SingleExcerciseViewController()
//        popupVC.modalPresentationStyle = .overFullScreen
//        present(popupVC, animated: false, completion: nil)
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
