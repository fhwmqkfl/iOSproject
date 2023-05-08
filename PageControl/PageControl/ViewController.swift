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

    //  1. 코드로 화면이동
    // 다음화면(nextVC)객체 생성 -> present
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let FirstVC = FirstViewController()
        
        FirstVC.modalPresentationStyle = .fullScreen
        FirstVC.someString = "아기상어"
        // 코드의 경우 아래방식이 가능은 하지만 위의 방식을 더 많이 사용함..!
//        FirstVC.mainLabel.text = "상어"
        present(FirstVC, animated: true)
    }
    
    //  2. 코드로 스토리보드 객체를 생성해, 화면이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        nextVC.someString = "아빠상어"
        
        self.present(nextVC, animated: true)
    }
    
    //  3. 스토리보드에서의 화면이동(간접세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
    }
    
    
}

