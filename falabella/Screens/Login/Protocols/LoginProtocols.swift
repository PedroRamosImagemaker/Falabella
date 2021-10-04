//
//  LoginProtocols.swift
//  falabella
//
//  Created by Image Maker on 3/10/21.
//

import Foundation
import UIKit

protocol LoginInteractorProtocol: AnyObject {
    var presenter: LoginInteractorOutputProtocol? { get set }
    var coreDataManager: CoreDataManagerProtocol { get set }
    
    func validateSigninUser(_ user: String, _ pass: String)
}

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    
    func validateUser(user: String, pass: String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func goListIndicators()
    func showError(_ message: String)
}

protocol LoginRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createModule() -> LoginViewController
    
    func presentList()
}

protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
    
    func showAlert(_ message: String)
}
