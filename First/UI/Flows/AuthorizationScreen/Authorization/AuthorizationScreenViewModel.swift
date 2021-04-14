//
//  AuthorizationScreenViewModel.swift
//  First
//
//  Created by Daniil G on 28.03.2021.
//

import Foundation

enum AuthorizationState {
    case signIn
    case signUp
}

protocol AuthorizationScreenViewModelDelegate: class {
    func didTapSignInButton(_ viewModel: AuthorizationScreenViewModel, email: String, password: String, authorizationState: AuthorizationState)
}

class AuthorizationScreenViewModel {
    
    // MARK: - Properties
    
    weak var delegate: AuthorizationScreenViewModelDelegate?
    private var authorizationState = AuthorizationState.signIn
    
    // MARK: - Functions
    
    func didTapSignInButton(email: String?, password: String?) {
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty else { return }
        delegate?.didTapSignInButton(self, email: email, password: password, authorizationState: authorizationState)
    }
    
    func authorization() -> Bool {
        switch authorizationState {
        case .signIn:
            authorizationState = .signUp
            return true
        case .signUp:
            authorizationState = .signIn
            return false
        }
    }
}
