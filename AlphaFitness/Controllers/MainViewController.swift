//
//  MainViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-03-14.
//

import UIKit

class MainViewController: UIViewController {
    
    var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentUser = currentUser {
                // Display the user's information
            }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
