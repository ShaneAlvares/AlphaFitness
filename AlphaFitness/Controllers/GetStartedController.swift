//
//  GetStartedController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-18.
//

import UIKit
import AVFoundation
import AVKit

class GetStartedController: UIViewController, AVPlayerViewControllerDelegate {
    
    var player: AVQueuePlayer!
    var playerLayer: AVPlayerLayer!
    var looper: AVPlayerLooper!
    
    let headerLable : UILabel = {
        let label = UILabel()
        label.text = "Start Your Journey\nToday with\nAlpha Fitness"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    let smallLable : UILabel = {
        let label = UILabel()
        label.text = "Set the goals you’re striving towards,\nbe it losing fat, getting a muscular body,\nor improving your endurance."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    
    let getStartedButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("GET STARTED", for: .normal)
        btn.setTitleShadowColor(UIColor.label, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .heavy)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.label.cgColor
        btn.layer.borderWidth = 1
        btn.isHidden = true
        btn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.addSubview(headerLable)
        view.addSubview(getStartedButton)
        view.addSubview(smallLable)
        viewPlayer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.getStartedButton.isHidden = false
        }
        addContraints()
    }
    
    func addContraints(){
        NSLayoutConstraint.activate([
            headerLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            headerLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //headerLable.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            smallLable.topAnchor.constraint(equalTo: headerLable.bottomAnchor, constant: 20),
            smallLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            smallLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            //smallLable.widthAnchor.constraint(equalToConstant: )
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
        let videoURL = Bundle.main.url(forResource: "jumpingBox", withExtension: "mp4")!
        let asset = AVAsset(url: videoURL)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVQueuePlayer(playerItem: playerItem)
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        // Create the layer for the video player
        playerLayer = AVPlayerLayer(player: player)
        
        // Adjust the size and position of the layer to fill the view
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        
        // Add the layer to the view's layer hierarchy
        view.layer.insertSublayer(playerLayer, at: 0)
        
        // Play the video
        player.play()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update the size and position of the layer when the view's size changes
        if(playerLayer != nil){
            playerLayer.frame = view.bounds
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
