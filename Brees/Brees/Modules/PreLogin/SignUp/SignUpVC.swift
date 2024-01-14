//
//  SignUpVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 12/01/24.
//

import UIKit
import JVFloatLabeledTextField

class SignUpVC: UIViewController {

    @IBOutlet private weak var nameTextField: JVFloatLabeledTextField!
    @IBOutlet private weak var backView3: UIView!
    @IBOutlet private weak var backView2: UIView!
    @IBOutlet private weak var backView1: UIView!
    @IBOutlet private weak var passwordsTextField: JVFloatLabeledTextField!
    @IBOutlet private weak var emailTextField: JVFloatLabeledTextField!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var showButton: UIButton!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var completeLabel: UILabel!
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var headingLabel: UILabel!
    
    private var nameText = ""
    private var emailText = ""
    private var passwordText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
        switch sender {
        case nameTextField:
            nameText = nameTextField.text ?? ""
        case emailTextField:
            emailText = emailTextField.text ?? ""
        case passwordsTextField:
            passwordText = passwordsTextField.text ?? ""
        default:
            print("error")
        }
        enableRegister()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        print(nameText,emailText,passwordText)
    }
    @IBAction func loginButton(_ sender: Any) {
    }
    @IBAction func showButton(_ sender: Any) {
        passwordsTextField.isSecureTextEntry.toggle()
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignUpVC {
    
    func initialSetup() {
        enableRegister()
        hideKeyboardWhenTappedAround()
        passwordsTextField.isSecureTextEntry = true
        backView1.layer.cornerRadius = backView1.frame.height/2
        backView2.layer.cornerRadius = backView1.frame.height/2
        backView3.layer.cornerRadius = backView1.frame.height/2
        nameTextField.font = UIFont(name: "Inter-Medium", size: 14)
        emailTextField.font = UIFont(name: "Inter-Medium", size: 14)
        passwordsTextField.font = UIFont(name: "Inter-Medium", size: 14)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = Colors.darkBlueButton
        loginButton.layer.cornerRadius = loginButton.frame.height/2
        loginButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        loginButton.setTitleColor(.white, for: .normal)
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = Colors.darkBlueButton.withAlphaComponent(0.10)
        registerButton.layer.cornerRadius = registerButton.frame.height/2
        registerButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
        registerButton.setTitleColor(Colors.darkBlueButton, for: .normal)
        let stringOne = "By signing up, you agree to the Terms of Service and Privacy Policy"
        let stringTwo = "Terms of Service and Privacy Policy"
        let range = (stringOne as NSString).range(of: stringTwo)
        let attributedText = NSMutableAttributedString.init(string: stringOne)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.darkBlueButton , range: range)
        infoLabel.attributedText = attributedText
        infoLabel.font = UIFont(name: "Inter-Medium", size: 14)
        welcomeLabel.font = UIFont(name: "Inter-Bold", size: 24)
        completeLabel.font = UIFont(name: "Inter-Medium", size: 14)
        welcomeLabel.textColor = Colors.darkBlueText
        headingLabel.font = UIFont(name: "Inter-Medium", size: 16)
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordsTextField.delegate = self
    }
    
    func enableRegister() {
        if nameText.count > 2 && emailText.isValidEmail() && passwordText.isValidPassword() {
            registerButton.isUserInteractionEnabled = true
            registerButton.layer.opacity = 1
        } else {
            registerButton.isUserInteractionEnabled = false
            registerButton.layer.opacity = 0.4
        }
    }
}

extension SignUpVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
       let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
       return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
   }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
