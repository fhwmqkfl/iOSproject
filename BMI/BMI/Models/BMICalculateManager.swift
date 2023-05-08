//
//  BMICalculateManager.swift
//  BMI
//
//  Created by coco on 2023/05/08.
//

import UIKit

struct BMICalculateManager {
    
    var bmi: Double?
    
    // bmi지수 계산
    // 구조체는 저장속성값 변경시 mutating 키워드 필요
    mutating func calculateBMI(height: String, weight: String) {
        guard let height = Double(height), let weight = Double(weight) else {
            bmi = 0.0
            return }
        var bmiNum = weight / (height * height) * 10000
        bmi = round(bmiNum * 10) / 10
    }
    
    // bmi결과값을 전달해줌
    func getBMIReseult() -> Double? {
        return bmi ?? 0.0
    }
    
    // background color 계산
    func backgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black}
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 217/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // get advice
    func getAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
            
        }
    }
}
