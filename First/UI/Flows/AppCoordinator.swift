//
//  AppCoordinator.swift
//  Chat
//
//  Created by Daniil G on 22.03.2021.
//

import UIKit

class AppCoordinator: AuthorizationScreenViewModelDelegate {
    
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
    
    func didTapSignInButton(_ viewModel: AuthorizationScreenViewModel) {
        signIn()
    }
    
    private func signIn() {
        print("signIn")
    }
}
