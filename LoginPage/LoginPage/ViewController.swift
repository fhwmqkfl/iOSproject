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
        btn.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        
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
    
    // MARK: - 비밀번호 재설정 버튼
    private let passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetbuttonTapped), for: .touchUpInside)
        
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
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 실행
    private let textViewHeight: CGFloat = 48
    
    // 입력창 선택시 레이블 이동을 구현하기위한 레이아웃 설정
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor) // y축 정렬제약
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor) // y축 정렬제약
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
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
            // label이 동적으로 움직이게 하기위해 가로 중앙 고정기능 끔
//            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor, constant: 0),
            emailInfoLabelCenterYConstraint,
            
            // passwordInfoLabel 레이아웃
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
//            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabelCenterYConstraint,
            
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
    
    @objc func resetbuttonTapped() {
        // alert 창을 띄운다
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼이 눌렸습니다")
        }
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    @objc func passwordSecureModeSetting() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension ViewController: UITextFieldDelegate {
    // 텍스트 필드 입력이 시작되면 레이블이 작아짐
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            
            // 오토레이아웃 업데이트(이동시킴)
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            
            // 오토레이아웃 업데이트(이동시킴)
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        // 이대로는 애니메이션처럼 보이긴하지만 아님 -> 애니메이션 효과 추가(일단 이대로 이해하고 넘어가자)
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    // 텍스트 필드 입력이 끝나면
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            // 빈칸이면 원래대로 되돌리기
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            // 빈칸이면 원래대로 되돌리기
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        // 이대로는 애니메이션처럼 보이긴하지만 아님 -> 애니메이션 효과 추가(일단 이대로 이해하고 넘어가자)
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
            }
        }
    }
}
 
