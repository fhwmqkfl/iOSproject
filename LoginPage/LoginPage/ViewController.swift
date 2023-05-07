//
//  ViewController.swift
//  LoginPage
//
//  Created by coco on 2023/05/08.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - email
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        
        return view
    }()
    
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "이메일주소 또는 전화번호"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 48
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        textField.clearsOnBeginEditing = true
//        textField.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return textField
    }()
    
    
    // MARK: - password
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        
        return view
    }()
    
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "비밀번호"
        label.textColor = .white
        return label
    }()

    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 48
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        textField.clearsOnBeginEditing = true

        // 비밀번호라 추가처리
        textField.isSecureTextEntry = true
//        textField.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return textField
    }()
    
    var passwordSecureButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("표시", for: .normal)
        btn.setTitleColor(.systemGray2, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        //        btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return btn
    }()
    
    // MARK: - login button
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return button
    }()
    
    // MARK: - 스택뷰
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        
        return st
    }()
    
    
    // MARK: - 비밀번호 재설정 버튼
    private let passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return button
    }()
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 실행
    private let textViewHeight: CGFloat = 48
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
    }

    func makeUI() {
        
        view.backgroundColor = UIColor.black

        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 방법 2
        NSLayoutConstraint.activate([
            // stackView 레이아웃
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight * 3 + 36),
            
            // emailInfoLabel 레이아웃
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor, constant: 0),
            
            // passwordInfoLabel 레이아웃
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            
            // passwordTextField 레이아웃
            passwordTextField.topAnchor.constraint(equalTo:passwordTextFieldView.topAnchor , constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            
            // passwordSecureButton 레이아웃
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // passwordResetButton 레이아웃
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)

        ])
        
        
        // 방법 1
        // emailTextFIeld 레이아웃
        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true   // left
        emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8).isActive = true // right
        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15).isActive = true // top
        emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2).isActive = true // botton
        
        
        
    }
}

 
