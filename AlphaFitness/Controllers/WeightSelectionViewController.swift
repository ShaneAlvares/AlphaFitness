//
//  WeightSelectionViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-17.
//

import UIKit

class WeightSelectionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "5 of 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray2
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.text = "What is your weight?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "Weight management as it provides users with a convenient tool to track their progress, set goals, and monitor their fitness activities, leading to greater accountability and motivation."
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
        btn.addTarget(self, action: #selector(gotoHeightSelection), for: .touchUpInside)
        return btn
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("CONTINOUE", for: .normal)
        btn.setTitleShadowColor(UIColor.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(gotoDashboard), for: .touchUpInside)
        return btn
    }()
    
    var cameraModePicker: UIPickerView!
    let captureModesList = Array(30...200)
    var rotationAngle: CGFloat! = -90 * (.pi/180)
    
    let measureType : UILabel = {
        let label = UILabel()
        label.text = "Kg"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    func setupPickerView() {
        
        let screenHeight = UIScreen.main.bounds.height
        let pickerHeight: CGFloat = 120
        
        let y = (screenHeight - pickerHeight) / 2
        
        cameraModePicker = UIPickerView()
        cameraModePicker.dataSource = self
        cameraModePicker.delegate = self
        view.addSubview(cameraModePicker)
        
        cameraModePicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        cameraModePicker.frame = CGRect(x: -150, y: y, width: view.bounds.width + 300, height: pickerHeight)
        print(cameraModePicker.bounds.maxY)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        view.addSubview(pageLabel)
        view.addSubview(questionLabel)
        view.addSubview(infoLabel)
        
        //        view.addSubview(btnWeightLoss)
        //        view.addSubview(btnMuscleGain)
        //        view.addSubview(btnCardiovascular)
        
        view.addSubview(measureType)
        
        
        view.addSubview(dividerView)
        view.addSubview(dividerVerticalView)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        addContraints()
        
        setupPickerView()
        
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
            measureType.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            measureType.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70)
        ])
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return captureModesList.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let modeView = UIView()
        modeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let modeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        modeLabel.textColor = .label
        modeLabel.text = String(captureModesList[row])
        modeLabel.textAlignment = .center
        modeLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .bold)
        modeView.addSubview(modeLabel)
        modeView.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return modeView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    @objc func gotoDashboard(){
        let controller = DashboardViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func gotoHeightSelection(){
        let controller = HeightSelectionViewController()
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
