//
//  ErrorScreenViewModel.swift
//  First
//
//  Created by Даниил Голубятников on 14.04.2021.
//

import Foundation

protocol ErrorScreenViewModelDelegate: class {
    func didTapСontinueButton(_ viewModel: ErrorScreenViewModel)
}

class ErrorScreenViewModel {
    
    // MARK: - Properties
    
    weak var delegate: ErrorScreenViewModelDelegate?
    
    // MARK: - Functions
    
    func didTapСontinueButton() {
        delegate?.didTapСontinueButton(self)
    }
}
