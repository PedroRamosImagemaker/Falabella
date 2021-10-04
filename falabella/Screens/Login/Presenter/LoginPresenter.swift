//
//  LoginPresenter.swift
//  falabella
//
//  Created by Image Maker on 3/10/21.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    var view: LoginViewProtocol?
    
    func validateUser(user: String, pass: String) {
        
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func goListIndicators() {
        router?.presentList()
    }
    
    func showError(_ message: String) {
        
    }
}
