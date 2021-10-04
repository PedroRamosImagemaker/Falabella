//
//  LoginViewController.swift
//  falabella
//
//  Created by Image Maker on 3/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterProtocol?
    private let userTextLabel: String = "User"
    private let passTextLabel: String = "Pass"
    private let userPlaceHolder: String = "User Indicators"
    private let passPlaceHolder: String = "Pass Indicators"
    private let signInButtonTitle: String = "Sign in"
    private let signUpButtonTitle: String = "Sign Up"
    private var userText: String = String()
    private var passText: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        customViews()
    }
    
    private func customViews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        stackView.addArrangedSubview(createLabel(userTextLabel))
        stackView.addArrangedSubview(createUserTextField())
        stackView.addArrangedSubview(createLabel(passTextLabel))
        stackView.addArrangedSubview(createPassTextField())
        stackView.addArrangedSubview(createSignInButton())
        stackView.addArrangedSubview(createSignUpButton())
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -45),
        ])
    }
    
    private func createLabel(_ text: String) -> UILabel {
        let textUserLabel = UILabel()
        textUserLabel.text = text
        textUserLabel.font = UIFont.boldSystemFont(ofSize: 16)
        textUserLabel.textColor = .systemBlue
        textUserLabel.textAlignment = .center
        textUserLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        return textUserLabel
    }
    
    private func createUserTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = userPlaceHolder
        textField.borderStyle = .bezel
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.addAction(UIAction { _ in
            self.userText = textField.text ?? String()
        }, for: .valueChanged)
        return textField
    }
    
    private func createPassTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = passPlaceHolder
        textField.borderStyle = .bezel
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.addAction(UIAction { _ in
            self.passText = textField.text ?? String()
        }, for: .valueChanged)
        return textField
    }
    
    private func createSignInButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(signInButtonTitle, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }
    
    private func createSignUpButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle(signUpButtonTitle, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        return button
    }
    
    @objc func signInButtonAction(sender: UIButton) {
        if userText.isEmpty || passText.isEmpty {
            presentAlert("Usuario o Contraseña no valida")
        } else {
            presenter?.validateUser(user: userText, pass: passText)
        }
    }
    
    @objc func signUpButtonAction(sender: UIButton) {
        Logger.info("SignUp")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    private func presentAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewProtocol {
    func showAlert(_ message: String) {
        presentAlert(message)
    }
}
