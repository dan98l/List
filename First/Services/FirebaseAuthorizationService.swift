//
//  FirebaseAuthorizationService.swift
//  First
//
//  Created by Daniil G on 28.03.2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

protocol Authorization {
    func auth() -> Bool
}

class FirebaseAuthorizationService {
    private static let sharedInstance = FirebaseAuthorizationService()
    static func shared() -> FirebaseAuthorizationService { sharedInstance }
    private let dataBase: Firestore
    
    private init() {
        dataBase = Firestore.firestore()
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
}
