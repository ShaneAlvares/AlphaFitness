//
//  SplashViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-19.
//

import UIKit

class SplashViewController: UIViewController {
    
    let appLogo : UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFill
        logo.image = UIImage(named: "aplhaLogo")
        return logo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(appLogo)
        addConstraints()
        //moveNext()
        
        // Do any additional setup after loading the view.
    }
    
    func moveNext(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // Code to run after 2 seconds
            //adding to navigation stack
            // self.navigationController?.pushViewController(GetStartedController(), animated: true)
            
            //can we used as a popup
            //let myViewController = GetStartedController()
            //self.present(myViewController, animated: true, completion: nil) commet - this is like a pop up modal
            
            //without navigation stack move to another screen
            //also can add custom trasision
            // Create the transition animation
            let transition = CATransition()
            transition.duration = 0.7
            transition.type = .reveal
            transition.subtype = .fromTop
            self.navigationController?.view.layer.add(transition, forKey: kCATransition)
            
            let myViewController = GetStartedController()
            self.navigationController?.setViewControllers([myViewController], animated: false)
        }
    }
    
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            appLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            appLogo.widthAnchor.constraint(equalToConstant: 150),
            appLogo.heightAnchor.constraint(equalToConstant: 150)
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
