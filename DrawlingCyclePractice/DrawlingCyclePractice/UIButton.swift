//
//  UIButton.swift
//  DrawlingCyclePractice
//
//  Created by coco on 2023/05/09.
//

import UIKit


final class MyButton: UIButton {
    
    var onAndOff = false
    
    func toggle() {
        self.onAndOff.toggle()
    }
}
