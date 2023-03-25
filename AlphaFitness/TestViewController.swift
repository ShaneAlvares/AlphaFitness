//
//  TestViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-20.
//

import UIKit

class TestViewController: UIViewController {
    
    let getStarted : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(getStarted)
        
        
        NSLayoutConstraint.activate([
            getStarted.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            getStarted.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStarted.widthAnchor.constraint(equalToConstant: 300),
            getStarted.heightAnchor.constraint(equalToConstant: 40)
        ])
        

        // Do any additional setup after loading the view.
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
