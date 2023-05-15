//
//  ViewController.swift
//  LoginPage
//
//  Created by coco on 2023/05/08.
//

import UIKit

final class ViewController: UIViewController {
    
    let loginView = LoginVIew()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetbuttonTapped), for: .touchUpInside)
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func loginButtonTapped() {
        print("로그인 버튼이 눌러졌습니다")
    }
}

