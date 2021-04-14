//
//  FirebaseAuthorizationService.swift
//  First
//
//  Created by Daniil G on 28.03.2021.
//

import UIKit
import FirebaseAuth

protocol Authorization {
    func auth() -> Bool
    func authWithEmail(email: String, password: String, completion: @escaping (Bool) -> ())
    func createWithEmail(email: String, password: String, completion: @escaping (Bool) -> ())
}

class FirebaseAuthorizationService {
    private static let sharedInstance = FirebaseAuthorizationService()
    static func shared() -> FirebaseAuthorizationService { sharedInstance }
    
    private init() {
        
    }
}

extension FirebaseAuthorizationService: Authorization {
    func auth() -> Bool {
        var authorization = false
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                authorization = false
            } else {
                authorization = true
            }
        }
        return authorization
    }
    
    func authWithEmail(email: String, password: String, completion: @escaping (Bool) -> ()) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if result != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func createWithEmail(email: String, password: String, completion: @escaping (Bool) -> ()) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if result != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
}
