//
//  ViewController.swift
//  BMI
//
//  Created by coco on 2023/05/08.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "km단위로 입력해주세요"
    }
    
    // 넘어가게 허락할지 말지 (무조건 허락이면 이걸 할 필요가 없음)
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다!!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            // BMI결과값을 다음 화면에 넘겨줌
            secondVC.bmiNumber = bmiManager.getBMIReseult()
            secondVC.adviceString = bmiManager.getAdviceString()
            secondVC.bmiColor = bmiManager.backgroundColor()
        }
    }
    // BMI 결과값 계산
    @IBAction func calculateButtonClicked(_ sender: UIButton) {
        bmiManager.calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
        
    }
}


extension ViewController: UITextFieldDelegate {
    // 숫자만 입력되게 하나하나 입력될때마다 체크 true면 입력, 아니면 입력안되게
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true // 글자입력 허용
        }
        return false // 글자입력 허용하지 않음
    }
    
    // 입력시 엔터치면 키->몸무게, 몸무게->키보드 닫히기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트 필드를 모두 종료(키보드내리기) -> 논리가 elseif가 좀더 넓다보니 먼저 한거임
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            // 두번째 텍스트필드로 넘어가게 설정
            weightTextField.becomeFirstResponder()
            return true
        }
        return false // 엔터를 허락하지 않음
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
