//
//  BottomNavBarController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-19.
//

import UIKit

class BottomNavBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create your view controllers for each tab
        let firstViewController = UINavigationController(rootViewController: TestTempViewController())
        let secondViewController = UIViewController()
        let thirdViewController = UIViewController()
        let fourthViewController = UIViewController()

        // Set the view controllers for the tab bar controller
       
        
        // Customize the tab bar appearance
        self.tabBar.tintColor = UIColor.black
//        self.tabBar.barTintColor = UIColor.white
       self.tabBar.backgroundColor = UIColor.white
        
        // Customize the tab bar icons and titles
        firstViewController.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(systemName: "house"), selectedImage: nil)
        secondViewController.tabBarItem = UITabBarItem(title: "Exercises", image: UIImage(systemName: "figure.run"), selectedImage: nil)
        thirdViewController.tabBarItem = UITabBarItem(title: "Schedules", image: UIImage(systemName: "calendar.badge.clock"), selectedImage: nil)
        fourthViewController.tabBarItem = UITabBarItem(title: "Other", image: UIImage(systemName: "person"), selectedImage: nil)
        
        self.viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]

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
