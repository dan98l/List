//
//  ErrorScreenViewController.swift
//  First
//
//  Created by Даниил Голубятников on 14.04.2021.
//

import UIKit

class ErrorScreenViewController: UIViewController, AutoLoadable {

    // MARK: - IBOutlets
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBAction func continueButton(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.didTapСontinueButton()
    }
    
    // MARK: - Properties
    
    var viewModel: ErrorScreenViewModel!
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingContinueButton()
    }
    
    private func settingContinueButton() {
        continueButton.layer.cornerRadius = continueButton.frame.size.height / 2
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.white.withAlphaComponent(0.75).cgColor
    }
}
