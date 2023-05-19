//
//  SplashViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-19.
//

import UIKit
//import SDWebImage

class SplashViewController: UIViewController {
    
    //    let appLogo : UIImageView = {
    //        let logo = UIImageView()
    //        logo.translatesAutoresizingMaskIntoConstraints = false
    //        logo.contentMode = .scaleAspectFill
    //        logo.image = UIImage.gifImageWithName("aplhaLogo")
    //        return logo
    //    }()
    
    let logoName : UILabel = {
        let label = UILabel()
        label.text = "ALPHA FITNESS"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    let appLogo: UIImageView = {
    //        let logo = UIImageView()
    //        logo.translatesAutoresizingMaskIntoConstraints = false
    //        logo.contentMode = .scaleAspectFill
    //        logo.sd_setImage(with: URL(string: "https://annesuppliers.com/Shane/IOSCW/newlogo.gif"), placeholderImage: nil, options: [], completed: nil)
    //        return logo
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(logoName)
        addConstraints()
    }
    
    func moveNext(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //without navigation stack move to another screen
            //also can add custom trasision
            // Create the transition animation
            let transition = CATransition()
            transition.duration = 0.7
            transition.type = .fade
            //transition.subtype = .fromTop
            self.navigationController?.view.layer.add(transition, forKey: kCATransition)
            
            let myViewController = GetStartedController()
            self.navigationController?.setViewControllers([myViewController], animated: false)
        }
    }
    
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            logoName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moveNext()
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
