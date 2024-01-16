//
//  SignUpVC.swift
//  Brees
//
//  Created by Rishabh Sharma(Personal) on 12/01/24.
//

import UIKit
import JVFloatLabeledTextField

class SignUpVC: UIViewController {

    enum ScreenType {
        case login
        case signup
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
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
    @IBOutlet private weak var forgotPasswordButton: UIButton!
    
    private var nameText = ""
    private var emailText = ""
    private var passwordText = ""
    private var screenType : ScreenType = .signup
    
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
        validationForContinue()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        switch screenType {
        case .login:
            screenType = .signup
            initialSetup()
        case .signup:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC {
                vc.nameText = nameText
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        switch screenType {
        case .login:
            print("LoginDone")
        case .signup:
            screenType = .login
            initialSetup()
        }
    }
    
    @IBAction func showButton(_ sender: Any) {
        passwordsTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        
    }
}

extension SignUpVC {
    
    func initialSetup() {
        validationForContinue()
        hideKeyboardWhenTappedAround()
        passwordsTextField.isSecureTextEntry = true
        backView1.layer.cornerRadius = backView1.frame.height/2
        backView2.layer.cornerRadius = backView1.frame.height/2
        backView3.layer.cornerRadius = backView1.frame.height/2
        loginButton.layer.cornerRadius = loginButton.frame.height/2
        registerButton.layer.cornerRadius = registerButton.frame.height/2
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordsTextField.delegate = self
        switch screenType {
        case .login:
            backView1.isHidden = true
            infoLabel.isHidden = true
            forgotPasswordButton.isHidden = false
            enableButton(button: registerButton)
            disableButton(button: loginButton)
        case .signup:
            backView1.isHidden = false
            infoLabel.isHidden = false
            forgotPasswordButton.isHidden = true
            enableButton(button: loginButton)
            disableButton(button: registerButton)
        }
        setFont()
        setText()
        setColor()
    }
    
    func setText() {
        switch screenType {
        case .login:
            welcomeLabel.text = "Welcome back"
            completeLabel.text = "Hey you’re back, fill in your details to get back in"
            titleLabel.text = "Login"
        case .signup:
            welcomeLabel.text = "Welcome to Brees"
            completeLabel.text = "Complete the sign up to get started"
            titleLabel.text = "Sing Up"
        }
        loginButton.setTitle("Login", for: .normal)
        registerButton.setTitle("Register", for: .normal)
        let stringOne = "By signing up, you agree to the Terms of Service and Privacy Policy"
        let stringTwo = "Terms of Service and Privacy Policy"
        let range = (stringOne as NSString).range(of: stringTwo)
        let attributedText = NSMutableAttributedString.init(string: stringOne)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.darkBlueButton , range: range)
        infoLabel.attributedText = attributedText
    }
    
    func setFont() {
        infoLabel.font = UIFont(name: "Inter-Medium", size: 14)
        welcomeLabel.font = UIFont(name: "Inter-Bold", size: 24)
        completeLabel.font = UIFont(name: "Inter-Medium", size: 14)
        headingLabel.font = UIFont(name: "Inter-Medium", size: 16)
        nameTextField.font = UIFont(name: "Inter-Medium", size: 14)
        emailTextField.font = UIFont(name: "Inter-Medium", size: 14)
        passwordsTextField.font = UIFont(name: "Inter-Medium", size: 14)
        registerButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
        loginButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 14)
    }
    
    func setColor() {
        registerButton.backgroundColor = Colors.darkBlueButton.withAlphaComponent(0.10)
        loginButton.backgroundColor = Colors.darkBlueButton
        loginButton.setTitleColor(.white, for: .normal)
        registerButton.setTitleColor(Colors.darkBlueButton, for: .normal)
        welcomeLabel.textColor = Colors.darkBlueText
        forgotPasswordButton.setTitleColor(Colors.darkBlueButton, for: .normal)
    }
    
    func enableButton(button: UIButton) {
        button.isUserInteractionEnabled = true
        button.layer.opacity = 1
    }
    
    func disableButton(button: UIButton) {
        button.isUserInteractionEnabled = false
        button.layer.opacity = 0.4
    }
    
    func validationForContinue() {
        switch screenType {
        case .signup:
            if nameText.count > 2 && emailText.isValidEmail() && passwordText.isValidPassword() {
                enableButton(button: registerButton)
            } else {
                disableButton(button: registerButton)
            }
        case .login:
            if emailText.isValidEmail() && passwordText.isValidPassword() {
                enableButton(button: loginButton)
            } else {
                disableButton(button: loginButton)
            }
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
