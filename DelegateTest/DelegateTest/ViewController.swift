//
//  ViewController.swift
//  DelegateTest
//
//  Created by coco on 2023/05/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    func setup() {
        self.view.backgroundColor = .gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
//        textField.placeholder = "Type Something!"
        
        textField.becomeFirstResponder()
    }

    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
}


extension ViewController: UITextFieldDelegate {
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        textField.placeholder = "Type Something!"
//        return true
//    }
//
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("유저가 입력을 시작함")
//    }
//
    // 각각의 문자열 입력 받는것
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! + string.count > 10 {
            return false
        } else {
            return true
        }
    }
    
    // 엔터키 눌렀을때 다음 액션 허락할지말지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "값을 입력하세요"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("유저가 입력을 끝냄")
        return true
    }
    // 텍스트필드의 입력이 실제로 끝났을때 호출됨
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드 출력이 끝남")
    }
}
