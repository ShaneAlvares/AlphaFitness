//
//  PopAddScheduleExcersiseViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-20.
//

import UIKit

class PopAddScheduleExcersiseViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    private let popupView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return contentView
    }()
    
    let pgName : UILabel = {
        let label = UILabel()
        label.text = "Add an Excersise"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let addExcerciseLabel : UILabel = {
        let label = UILabel()
        label.text = "Selected Excercise: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let excerises = ["Excercise 01", "Excercise 02", "Excercise 03", "Excercise 04", "Excercise 05", "Excercise 07", "Excercise 08"]
    
    let dropdownButton: UIButton = {
        let dropdownButton = UIButton(type: .system)
        dropdownButton.setTitle("Select an Excercise", for: .normal)
        dropdownButton.tintColor = .black
        dropdownButton.layer.cornerRadius = 3
        dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
        dropdownButton.setImage(UIImage(systemName: "plus"), for: .normal)
        dropdownButton.layer.borderColor = UIColor.black.cgColor
        dropdownButton.layer.borderWidth = 1
        dropdownButton.semanticContentAttribute = .forceRightToLeft
        dropdownButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        dropdownButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        return dropdownButton
    }()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.borderWidth = 1.0
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        //tableView.backgroundColor = .white
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true // Enable scrolling
        tableView.isHidden = true
        return tableView
    }()
    
    var isDropdownVisible = false
    //    var onSubmit: ((_ name: String, _ age: Int) -> Void)?
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Excercise", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.label.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //        button.addTarget(self, action: #selector(gotoHome), for: .touchUpInside)
        // button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        //present(timePickerViewController, animated: true, completion: nil)
        view.addSubview(popupView)
        popupView.addSubview(pgName)
        
        popupView.addSubview(addExcerciseLabel)
        popupView.addSubview(dropdownButton)
        // Create the table view
        tableView.delegate = self
        tableView.dataSource = self
        popupView.addSubview(tableView)
        popupView.addSubview(submitButton)
        
        // Configure Auto Layout constraints
        
        
        addConstraints()
        
        
        // Add tap gesture recognizer to dismiss the popup when tapping outside the popup area
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        
        let checkTapTable = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideTableView))
        popupView.addGestureRecognizer(checkTapTable)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            //            popupView.topAnchor.constraint(equalTo: view.topAnchor),
            popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popupView.widthAnchor.constraint(equalTo: view.widthAnchor),
            popupView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        NSLayoutConstraint.activate([
            pgName.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20),
            pgName.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
        ])
        
        
        
        NSLayoutConstraint.activate([
            addExcerciseLabel.topAnchor.constraint(equalTo: pgName.bottomAnchor, constant: 20),
            addExcerciseLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            dropdownButton.topAnchor.constraint(equalTo: addExcerciseLabel.bottomAnchor, constant: 10),
            dropdownButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            dropdownButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            dropdownButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: dropdownButton.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: dropdownButton.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200) // Fixed height
        ])
        NSLayoutConstraint.activate([
            
            submitButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -55),
            submitButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        //        delegate?.didSelectTime(sender.date)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Animate the popup view sliding up from the bottom
        UIView.animate(withDuration: 0.3) {
            self.popupView.frame.origin.y = self.view.bounds.height - 500
        }
    }
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Dismiss the popup when tapping outside the popup area
        let location = gestureRecognizer.location(in: view)
        if !popupView.frame.contains(location) {
            dismissPopup()
        }
    }
    
    private func dismissPopup() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popupView.frame.origin.y = self.view.bounds.height
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc private func submitButtonTapped() {
        print("Shane")
        dismissPopup()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return excerises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = excerises[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
        cell.addGestureRecognizer(tapGesture)
        
        return cell
    }
    
    @objc func cellTapped(_ gesture: UITapGestureRecognizer) {
        guard let cell = gesture.view as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let selectedDay = excerises[indexPath.row]
        // Handle the cell tap event for the selected day
        for visibleIndexPath in tableView.indexPathsForVisibleRows ?? [] {
            let visibleCell = tableView.cellForRow(at: visibleIndexPath)
            visibleCell?.backgroundColor = UIColor.clear
        }
        
        // Change the background color of the tapped cell
        cell.backgroundColor = UIColor.gray
        dropdownButton.setTitle(selectedDay, for: .normal)
        hideDropdown()
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDay = excerises[indexPath.row]
        dropdownButton.setTitle(selectedDay, for: .normal)
        hideDropdown()
    }
    
    // MARK: - Button tap action
    
    @objc func dropdownButtonTapped() {
        if isDropdownVisible {
            hideDropdown()
        } else {
            showDropdown()
        }
    }
    
    // MARK: - Dropdown visibility methods
    
    func showDropdown() {
        tableView.isHidden = false
        isDropdownVisible = true
        
        popupView.bringSubviewToFront(tableView)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func hideDropdown() {
        isDropdownVisible = false
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.tableView.isHidden = true
        }
    }
    
    @objc func handleTapOutsideTableView(_ gesture: UITapGestureRecognizer) {
        if isDropdownVisible {
            let tapLocation = gesture.location(in: view)
            
            if !tableView.frame.contains(tapLocation) && !dropdownButton.frame.contains(tapLocation) {
                hideDropdown()
            }
        }
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
