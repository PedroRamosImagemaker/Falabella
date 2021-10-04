//
//  LoginRouter.swift
//  falabella
//
//  Created by Image Maker on 3/10/21.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> LoginViewController {
        let ref = LoginViewController()
        let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
        
        let router: LoginRouterProtocol = LoginRouter()
        router.viewController = ref
        
        let interactor: LoginInteractorProtocol = LoginInteractor()
        interactor.presenter = presenter
        
        presenter.view = ref
        presenter.router = router
        presenter.interactor = interactor
        
        ref.presenter = presenter
        return ref
    }
    
    func presentList() {
        // TO DO
    }
}
