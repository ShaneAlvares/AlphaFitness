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
    
    func verifyLogin(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        let db = Firestore.firestore()
        let userCollection = db.collection("users")
        
        userCollection.whereField("email", isEqualTo: email)
            .whereField("password", isEqualTo: password)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    //print("Error getting user: \(error.localizedDescription)")
                    completion(nil,nil)
                } else {
                    guard let snapshot = snapshot else {
                        //print("No any user found")
                        completion(nil,nil)
                        return
                    }

                    if let document = snapshot.documents.first {
                        //let teacher = Teacher(document: document)
                        //print("User Logged Successfully")
                        completion("User Logged Successfully", nil)
                        
                    } else {
                        //print("user not found")
                        completion(nil,nil)
                    }
                }
            }
    }
    
//    func login(with user: User, completion: @escaping (Bool) -> Void) {
//            Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
//                if let error = error as NSError? {
//                    print("Login failed: \(error.localizedDescription)")
//                    print("Error code: \(error.code)")
//                    completion(false)
//                } else {
//                    print("Login successful")
//                    completion(true)
//                }
//            }
//        }
    
//    func findUser() {
//        let db = Firestore.firestore()
//        let teachersCollection = db.collection("users")
//
//        teachersCollection.whereField("email", isEqualTo: "shane@gmail.com")
//                         .whereField("password", isEqualTo: "1234")
//                         .getDocuments { (snapshot, error) in
//            if let error = error {
//                print("Error getting teacher: \(error.localizedDescription)")
//                //completion(nil)
//            } else {
//                guard let snapshot = snapshot else {
//                    print("Snapshot is nil")
//                    //completion(nil)
//                    return
//                }
//
//                if let document = snapshot.documents.first {
//                    //let teacher = Teacher(document: document)
//                    print("Teacher found")
//                } else {
//                    print("Teacher not found")
//                   // completion(nil)
//                }
//            }
//        }
//    }
}
