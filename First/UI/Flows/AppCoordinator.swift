//
//  AppCoordinator.swift
//  Chat
//
//  Created by Daniil G on 22.03.2021.
//

import UIKit

class AppCoordinator: AuthorizationScreenViewModelDelegate, ErrorScreenViewModelDelegate {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    private let window: UIWindow
    private let authorization = FirebaseAuthorizationService.shared()
    
    private let homeCoordinator: HomeCoordinator
    
    // MARK: - Functions
    
    init(window: UIWindow) {
        self.window = window
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        print(authorization.auth())
        if authorization.auth() {
            showHomeScreen()
        } else {
            showAuthorizationScreen()
        }
    }
    
    private func showAuthorizationScreen() {
        let authorizationScreenViewModel = AuthorizationScreenViewModel()
        authorizationScreenViewModel.delegate = self
        
        let authorizationScreenViewController = AuthorizationScreenViewController.instantiate(from: "AuthorizationScreen")
        authorizationScreenViewController.viewModel = authorizationScreenViewModel
        navigationController.pushViewController(authorizationScreenViewController, animated: true)
    }
    
    private func showHomeScreen() {
        homeCoordinator.start()
    }
    
    func didTapSignInButton(_ viewModel: AuthorizationScreenViewModel, email: String, password: String, authorizationState: AuthorizationState) {
        
        if authorizationState == .signIn {
            signIn(email: email, password: password)
        } else {
            signUp(email: email, password: password)
        }
    }
    
    private func signIn(email: String, password: String) {
        authorization.authWithEmail(email: email, password: password) { auth in
            if auth {
                self.showHomeScreen()
            } else {
                self.showErrorScreen()
            }
        }
    }
    
    private func signUp(email: String, password: String) {
        authorization.createWithEmail(email: email, password: password) { auth in
            if auth {
                self.showHomeScreen()
            } else {
                self.showErrorScreen()
            }
        }
    }
    
    private func showErrorScreen() {
        let errorScreenViewModel = ErrorScreenViewModel()
        errorScreenViewModel.delegate = self
        
        let errorScreenViewController = ErrorScreenViewController.instantiate(from: "AuthorizationScreen")
        errorScreenViewController.viewModel = errorScreenViewModel
        navigationController.present(errorScreenViewController, animated: true, completion: nil)
    }
    
    func didTapСontinueButton(_ viewModel: ErrorScreenViewModel) {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
