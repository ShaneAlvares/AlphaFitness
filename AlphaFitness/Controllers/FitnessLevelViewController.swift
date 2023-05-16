//
//  FitnessLevelViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-15.
//

import UIKit

class FitnessLevelViewController: UIViewController {
    
    let backgroundImage : UIImageView = {
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "bgImageSelections")
        bgImage.contentMode = .scaleAspectFit
//        bgImage.frame = _self.view.bounds
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return bgImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)

        // Do any additional setup after loading the view.
    }
    
    func addContraints(){
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            //headerLable.widthAnchor.constraint(equalToConstant: 300)
        ])
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
