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
    
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray2
        
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        
        guard let bmi = bmiNumber else { return }
        bmiLabel.text = String(bmi)
        adviceLabel.text = adviceString
        bmiLabel.backgroundColor = bmiColor
    }
    
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
    

}
