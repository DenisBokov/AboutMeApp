//
//  LoginViewController.swift
//  AuthorizationApp
//
//  Created by Denis Bokov on 04.06.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var contentLabel: UILabel!
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userDenis = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGadientLayer()
        
        // Добавить View в центр сообщений как наблюдателя за сообщением о появлении клавиатуры и вызвать функцию подъема контента
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(moveContentUp),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        // Добавить View в центр сообщений как наблюдателя за сообщением об изчезновении клавиатуры и вызвать функцию возвращения контента в исходное положение
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(moveContentBack),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    // Скрыть клавиатуру
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameTextField.text == userDenis.login && passwordTextField.text == userDenis.password {
            guard let aboutMeVC = segue.destination as? UITabBarController else { return }
            guard let viewControllers = aboutMeVC.viewControllers else { return }
            viewControllers.forEach { viewController in
                if let firstVC = viewController as? AboutMeViewController {
                    firstVC.greeting = userDenis.person?.fullName
                }
            }
        } else {
            showAlert(with: "Не верный логин или пароль", and: "Повторите попытку снова или воспользуйтесь подсказсками ниже")
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? AboutMeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotUserNameTapped() {
        showAlert(with: "Ваш логин:", and: userDenis.login)
    }
    
    @IBAction func forgotPasswordTapped() {
        showAlert(with: "Ваш пароль:", and: userDenis.password)
    }
    
    // Создать фукцию для поднятия контента при появлении клавиатуры
    @objc func moveContentUp(notification: NSNotification) {
        
        // Получить высоту клавиатуры
        let userInfo = notification.userInfo
        let keyboardFrame = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        let keyboardHeight = keyboardFrame!.size.height
        
        // Расчитать высоту закрываемого контента
        let emptySpaceHeight = view.frame.size.height - contentLabel.frame.origin.y - contentLabel.frame.size.height
        let coveredContentHeight = keyboardHeight - emptySpaceHeight
        
        // Поднять View со всеми элементами на высоту закрываемого контента
        view.frame.origin.y = -coveredContentHeight
    }
    
    // Создать фукцию для возвращении контента в исходное положение при закрытие клавиатуры
    @objc func moveContentBack(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

