//
//  SingleExcerciseTwoViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//

import UIKit
import AVFoundation
import AVKit

class SingleExcerciseTwoViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    var player: AVQueuePlayer!
    var playerLayer: AVPlayerLayer!
    var looper: AVPlayerLooper!
    
    let headerLable : UILabel = {
        let label = UILabel()
        label.text = "Push Ups"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    let smallLable : UILabel = {
        let label = UILabel()
        label.text = "Push-ups are a form of exercise that target the muscles in the upper body, particularly the chest, shoulders, and arms. They involve lowering and raising the body by using the arms while maintaining a straight back. Playing push-up videos may serve as a visual guide or motivation for individuals who want to learn or perform push-ups correctly."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let cardView : CardView = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
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
    
    
    let getStartedButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("START EXCERSICE", for: .normal)
        btn.setTitleShadowColor(UIColor.label, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.black
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.label.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .label
        view.addSubview(headerLable)
        view.addSubview(getStartedButton)
        view.addSubview(smallLable)
        viewPlayer()
        
        addStackForCard()
        view.addSubview(cardView)
    
        addContraints()
    }
    
    func addStackForCard(){
        for i in ["black", "green", "yellow"] {
            
            let label = createLabel(with: (i))
            // Add label to the stack view
            stackView.addArrangedSubview(label)
        }
        
        cardView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
        
    }
    
    func findColor(with text: String) -> UIColor {
        let colorName = text
        let color: UIColor
        print(text)

        switch colorName {
            case "black":
               // print("df")
                color = UIColor.black
            case "yellow":
                color = UIColor.yellow
            case "green":
                color = UIColor.green
            // Add more cases for other color names
            default:
                color = UIColor.clear
        }
        
        return color
    }
    
    func createLabel(with text: String) -> UIView {
        let headTitle = UILabel()
        headTitle.text = "30min"
        headTitle.textAlignment = .center
        headTitle.backgroundColor = .clear
        headTitle.textColor = .black
        headTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let subTitle = UILabel()
        subTitle.text = "Time"
        subTitle.textAlignment = .center
        subTitle.backgroundColor = .clear
        subTitle.textColor = .gray
        subTitle.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        
        let progressViewCompleted = UIView()
        progressViewCompleted.backgroundColor = findColor(with: (text))
        progressViewCompleted.layer.cornerRadius = 5
        
        
        let itemContainer = UIView()
        itemContainer.addSubview(progressViewCompleted)
        itemContainer.addSubview(headTitle)
        itemContainer.addSubview(subTitle)
        
        progressViewCompleted.translatesAutoresizingMaskIntoConstraints = false
        headTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            progressViewCompleted.topAnchor.constraint(equalTo: itemContainer.topAnchor, constant: 10),
            progressViewCompleted.centerXAnchor.constraint(equalTo: itemContainer.centerXAnchor),
            progressViewCompleted.widthAnchor.constraint(equalTo: itemContainer.widthAnchor, multiplier: 0.9),
            progressViewCompleted.heightAnchor.constraint(equalToConstant: 8),
            
            headTitle.topAnchor.constraint(equalTo: progressViewCompleted.bottomAnchor,constant: 10),
            headTitle.centerXAnchor.constraint(equalTo: itemContainer.centerXAnchor),
            
            subTitle.topAnchor.constraint(equalTo: headTitle.bottomAnchor, constant: 10),
            subTitle.centerXAnchor.constraint(equalTo: itemContainer.centerXAnchor),
            
            
        ])
        
        return itemContainer
    }
    
    func addContraints(){
        NSLayoutConstraint.activate([
            headerLable.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 2 + 10),
            headerLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //headerLable.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            smallLable.topAnchor.constraint(equalTo: headerLable.bottomAnchor, constant: 10),
            smallLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            smallLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            //smallLable.widthAnchor.constraint(equalToConstant: )
        ])
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: smallLable.bottomAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: smallLable.leadingAnchor, constant: 6),
            cardView.trailingAnchor.constraint(equalTo: smallLable.trailingAnchor, constant: -6),
            //cardView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        
        NSLayoutConstraint.activate([
            getStartedButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //getStartedButton.widthAnchor.constraint(equalToConstant: 300),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            getStartedButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
    }
    
    func viewPlayer(){
        // Create the video player
        let videoURL = Bundle.main.url(forResource: "pushupsvid", withExtension: "mp4")!
        let asset = AVAsset(url: videoURL)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVQueuePlayer(playerItem: playerItem)
        looper = AVPlayerLooper(player: player, templateItem: playerItem)

        // Create the layer for the video player
        playerLayer = AVPlayerLayer(player: player)

        
        


        // Adjust the size and position of the layer to fill the view
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2)
        playerLayer.videoGravity = .resizeAspectFill

        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: playerLayer.bounds,
              byRoundingCorners: [.bottomLeft, .bottomRight],
              cornerRadii: CGSize(width: 15.0, height: 15.0)).cgPath
        playerLayer.mask = maskLayer

        

        // Add the layer to the view's layer hierarchy
        view.layer.insertSublayer(playerLayer, at: 0)

        // Play the video
        player.play()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update the size and position of the layer when the view's size changes
        if(playerLayer != nil){
            playerLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2)

        }
        
    }
    
    @objc private func goToLogin(){
        let controller = LoginViewController()
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
