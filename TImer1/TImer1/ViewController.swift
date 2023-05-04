//
//  ViewController.swift
//  TImer1
//
//  Created by coco on 2023/05/04.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var second: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "초를 선택하세요"
        slider.value = 0.5

    }

    
    @IBAction func sliderChanged(_ sender: Any) {
        // 슬라이더의 벨류값을 가지고 메인레이블의 텍스트를 셋팅
        second = Int(slider.value * 60)
        timerLabel.text = "\(second)초"
        
    }
    
    @IBAction func timerStartButton(_ sender: Any) {
        // 버튼 중복 클릭시 타이머 중복 실행 막기위해 해당 코드 삽입
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)

    }
    
    @objc func doSomethingAfter1Second() {
        if second > 0 {
            second -= 1
            slider.value = Float(second) / Float(60)
            timerLabel.text = "\(second)초"
        } else {
            second = 0
            timerLabel.text = "짜란"
            timer?.invalidate()
            
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
        
    }
    
    // 슬라이더 가운데, timerLabel = "초를 선택하세요"
    @IBAction func resetButton(_ sender: Any) {
        
        timerLabel.text = "초를 선택하세요"
        slider.value = 0.5
        
        // 타이머 비활성화 필요
        timer?.invalidate()
    }
}

