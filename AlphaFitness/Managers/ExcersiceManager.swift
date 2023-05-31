//
//  ExcersiceManager.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-31.
//

import Firebase
import FirebaseFirestore


class ExcersiceManager {
    static let shared = ExcersiceManager()
    
    func findUser(completion: @escaping ([String]?, Error?) -> Void) {
        var excersices = [String]()
        let db = Firestore.firestore()
        let excersicesCollection = db.collection("excersices")
        
        excersicesCollection.getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil, error)
            } else {
                guard let snapshot = snapshot else {
                    completion(nil, nil)
                    return
                }
                
                for document in snapshot.documents {
                    let value = document.data()["Name"] as? String ?? ""
                    excersices.append(value)
                }
                
                completion(excersices, nil)
            }
        }
    }
}
