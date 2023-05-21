//
//  AuthManager.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-21.
//
import Firebase
import FirebaseFirestore


class AuthManager {
    static let shared = AuthManager()
    
    
    
    func login(with user: User, completion: @escaping (Bool) -> Void) {
            Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
                if let error = error as NSError? {
                    print("Login failed: \(error.localizedDescription)")
                    print("Error code: \(error.code)")
                    completion(false)
                } else {
                    print("Login successful")
                    completion(true)
                }
            }
        }
    
    func findUser() {
        let db = Firestore.firestore()
        let teachersCollection = db.collection("users")
        
        teachersCollection.whereField("email", isEqualTo: "shane@gmail.com")
                         .whereField("password", isEqualTo: "1234")
                         .getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting teacher: \(error.localizedDescription)")
                //completion(nil)
            } else {
                guard let snapshot = snapshot else {
                    print("Snapshot is nil")
                    //completion(nil)
                    return
                }
                
                if let document = snapshot.documents.first {
                    //let teacher = Teacher(document: document)
                    print("Teacher found")
                } else {
                    print("Teacher not found")
                   // completion(nil)
                }
            }
        }
    }
}
