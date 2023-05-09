//
//  SecondViewController.swift
//  BMI
//
//  Created by coco on 2023/05/08.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray2
        
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        
        guard let bmi = bmi else { return }
        
        bmiLabel.text = "\(bmi.value)"
        adviceLabel.text = bmi.advice
        bmiLabel.backgroundColor = bmi.matchColor
    }
    
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        if let firstVC = presentingViewController as? ViewController {
            firstVC.weightTextField.text = nil
            firstVC.heightTextField.text = nil
            
        }
        dismiss(animated: true)
        
    }
    

}
