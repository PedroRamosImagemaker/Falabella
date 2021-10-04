//
//  LoginInteractor.swift
//  falabella
//
//  Created by Image Maker on 3/10/21.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginInteractorOutputProtocol?
    var coreDataManager: CoreDataManagerProtocol
    
    @Inject private var getAllIndicatorUsecase: GetAllIndicatorUseCase
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.coreDataManager = coreDataManager
    }
    
    func validateSigninUser(_ user: String, _ pass: String) {
        let items = coreDataManager.getAllItems()
        if items.first(where: { value in
            return value.user == user && value.pass == pass
        }) != nil {
            presenter?.goListIndicators()
        } else {
            presenter?.showError("Usuario no existe, por favor crearlo")
        }
    }
}
