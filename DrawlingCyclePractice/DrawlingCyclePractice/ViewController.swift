//
//  ViewController.swift
//  DrawlingCyclePractice
//
//  Created by coco on 2023/05/09.
//

import UIKit

class ViewController: UIViewController {
    // 제약조건을 저장하기 위한 변수 선언
    // (나중에 접근해서 변경하기 위함)
    private var btnHeightAnchor : NSLayoutConstraint!
    private var btnWidthAnchor: NSLayoutConstraint!
    
    private lazy var myButton: MyButton = {
        let btn = MyButton()
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .yellow
        btn.setTitle("Button", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(handleAnimationEffect), for:.touchUpInside)
        btn.onAndOff = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(myButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 원칙적인 오토레이아웃 설정 (높이, 넓이)
//        myButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //myButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // 제약조건을 변수에 저장
        btnHeightAnchor = myButton.heightAnchor.constraint(equalToConstant: 60)
        btnWidthAnchor = myButton.widthAnchor.constraint(equalToConstant: 100)
        
        btnHeightAnchor.isActive = true
        btnWidthAnchor.isActive = true
        
        // 원칙적인 오토레이아웃 설정 (가운데 정렬 - X, Y축)
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func handleAnimationEffect() {
        
        // 높이/넓이 변경 코드
        if !myButton.onAndOff {
            btnHeightAnchor.constant = 400
            btnWidthAnchor.constant = 200
        } else {
            btnHeightAnchor.constant = 60
            btnWidthAnchor.constant = 100
        }
        
        // 애니메이션 적용
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded() // 지금 다시 그려..!
        }
        
        myButton.toggle()
    }

}

