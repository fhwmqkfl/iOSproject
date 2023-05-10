//
//  LoginViewController.swift
//  Nav&Tab
//
//  Created by coco on 2023/05/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginButton: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
    
    
    
    @objc func loginButtonTapped() {
        if let presentingVC = presentingViewController { // 옵셔널 바인딩
            let tabBarCon = presentingVC as! UITabBarController   // 탭바에 접근하기
            let nav = tabBarCon.viewControllers?[0] as! UINavigationController  // 네비게이션바에 접근하기
            let firstVC = nav.viewControllers[0] as! FirstViewController  // FirstVC에 접근하기
            firstVC.isLoggedIn.toggle()  // 로그인 되었다고 상태 변화시키기 (실제 앱에서 이렇게 구현할 일은 없음)
        }

        
//        if let presentingVC = presentingViewController {
//            let tabBarCon = presentingVC as! UITabBarController
//            let firstVc = tabBarCon.viewControllers?[0] as! FirstViewController
//            firstVc.isLogined.toggle()
//        }
            
        dismiss(animated: true)
    }


}
