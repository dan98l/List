//
//  AuthorizationScreenViewController.swift
//  First
//
//  Created by Daniil G on 28.03.2021.
//

import UIKit

class AuthorizationScreenViewController: UIViewController, AutoLoadable {

    // MARK: - IBOutlets
    
    @IBOutlet var authorizationLabel: UILabel!
    @IBOutlet var accountLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func signInButton(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.didTapSignInButton(email: emailTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        if viewModel.authorization() {
            settingSignUp()
        } else {
            settingSignIn()
        }
    }
    
    // MARK: - Properties
    
    var viewModel: AuthorizationScreenViewModel!
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeDownSetting()
        settingSignInButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func swipeDownSetting() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc private func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    private func settingSignInButton() {
        signInButton.layer.cornerRadius = signInButton.frame.size.height / 2
        signInButton.alpha = 0.0
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.withAlphaComponent(0.75).cgColor
        showSignInButtonWithAnimations()
    }
    
    private func showSignInButtonWithAnimations() {
        UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseIn, animations: {
            self.signInButton.alpha = 1.0
        })
    }
    
    private func settingSignIn() {
        authorizationLabel.text = "Вход"
        accountLabel.text = "Нет аккаунта?"
        signInButton.setTitle("Войти", for: .normal)
        signUpButton.setTitle("Зарегистрироваться", for: .normal)
    }
    
    private func settingSignUp() {
        authorizationLabel.text = "Регистрация"
        accountLabel.text = "Уже есть аккаунт?"
        signInButton.setTitle("Зарегистрироваться", for: .normal)
        signUpButton.setTitle("Войти", for: .normal)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension AuthorizationScreenViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
