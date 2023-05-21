//
//  PopStartExcersiseViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//

import UIKit

class PopStartExcersiseViewController: UIViewController  {
    
    var timer: Timer?
    var counter: TimeInterval = 0
    let label : UILabel = {
        let label = UILabel()
        label.text = "00:00:00.000"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
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
    
    
    
    let buttonDissmiss : UIButton = {
        let viewMoreBtn = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        let symbolImage = UIImage(systemName: "x.circle", withConfiguration: symbolConfiguration)
        viewMoreBtn.setImage(symbolImage, for: .normal)
        //viewMoreBtn.setImage(UIImage(systemName: "arrow.forward.circle"), for: .normal)
        viewMoreBtn.tintColor =  .systemGray
        viewMoreBtn.translatesAutoresizingMaskIntoConstraints = false
        viewMoreBtn.addTarget(self, action: #selector(dismissPopup), for: .touchUpInside)
        viewMoreBtn.backgroundColor = .clear
        return viewMoreBtn
    }()
    
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("STOP EXCERSISE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //        button.addTarget(self, action: #selector(gotoHome), for: .touchUpInside)
        button.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        //present(timePickerViewController, animated: true, completion: nil)
        view.addSubview(popupView)
        popupView.addSubview(pgName)
        popupView.addSubview(buttonDissmiss)
        
        // Set up the label
        
        view.addSubview(label)
        
        // Start the timer
        startTimer()
        
        
        popupView.addSubview(submitButton)
        
        // Configure Auto Layout constraints
        
        
        addConstraints()
        
        
        // Add tap gesture recognizer to dismiss the popup when tapping outside the popup area
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        
        
    }
    func startTimer() {
        // Invalidate the timer if it's already running
        stopTimer()
        
        // Create a timer that fires every millisecond
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timerFired() {
        counter += 0.001
        let milliseconds = Int(counter.truncatingRemainder(dividingBy: 1) * 1000)
        let totalSeconds = Int(counter)
        let seconds = totalSeconds % 60
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        
        // Update the label text
        let formattedTime = String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
        label.text = formattedTime
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
            label.centerYAnchor.constraint(equalTo: popupView.centerYAnchor, constant: -20),
            label.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            buttonDissmiss.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20),
            buttonDissmiss.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
        ])
        
        
        
        
        
        
        NSLayoutConstraint.activate([
            
            submitButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -55),
            submitButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
            //dismissPopup()
        }
    }
    
    @objc func dismissPopup() {
        stopTimer()
        label.isHidden = true
        UIView.animate(withDuration: 0.3, animations: {
            self.popupView.frame.origin.y = self.view.bounds.height
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    //    @objc private func submitButtonTapped() {
    //        print("Shane")
    //        dismissPopup()
    //    }
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
