//
//  LocalStorageViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//

import UIKit

class LocalStorageViewController: UIViewController {

    @IBOutlet weak var dataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve UserDefaults data
//        if let data = UserDefaults.standard.dictionaryRepresentation() as? [String: Any] {
//            // Convert data to a formatted string
//            let formattedData = data.map { "\($0.key): \($0.value)" }.joined(separator: "\n")
//            
//            // Display the data in the text view
//            print(formattedData)
//        }
//       
//        print(data)
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
