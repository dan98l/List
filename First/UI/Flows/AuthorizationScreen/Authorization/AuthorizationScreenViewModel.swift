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
    func didTapSignInButton(_ viewModel: AuthorizationScreenViewModel)
}

class AuthorizationScreenViewModel {
    
    // MARK: - Properties
    
    weak var delegate: AuthorizationScreenViewModelDelegate?
    private var authorizationState = AuthorizationState.signUp
    
    // MARK: - Functions
    
    func didTapSignInButton() {
        delegate?.didTapSignInButton(self)
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
