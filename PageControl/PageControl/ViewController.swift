//
//  ViewController.swift
//  PageControl
//
//  Created by coco on 2023/05/08.
//
/*
 연습 4가지
 1. 코드로 화면이동
 2. 코드로 스토리보드 객체를 생성해, 화면이동
 3. 스토리보드에서의 화면이동(간접세그웨이)
 4. 스토리보드에서의 화면이동(직접세그웨이)

 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 1. 코드로 화면이동
    // 다음화면(nextVC)객체 생성 -> present
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let FirstVC = FirstViewController()
        
        FirstVC.modalPresentationStyle = .fullScreen
        FirstVC.someString = "아기상어"
        // 코드의 경우 아래방식이 가능은 하지만 위의 방식을 더 많이 사용함..!
//        FirstVC.mainLabel.text = "상어"
        present(FirstVC, animated: true)
    }
    
    // 2. 코드로 스토리보드 객체를 생성해, 화면이동
    // 다음화면(nextVC)객체 생성 -> present
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        nextVC.someString = "아빠상어"
        
        self.present(nextVC, animated: true)
    }
    
    // 3. 스토리보드에서의 화면이동(간접세그웨이)
    // segue만들기 -> (performSegue) -> prepare
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            // 데이터 전달
            thirdVC.someString = "엄마상어"
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "뚜루루뚜뚜"
        }
    }
    
    
    var num = 3
    // 4) 버튼에서 직접적으로 연결되었을때 세그웨이
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if num > 2 {
            // 다음화면으로 넘어가지 않음
            return false
        } else {
            return true
        }
    }
    
    
}

