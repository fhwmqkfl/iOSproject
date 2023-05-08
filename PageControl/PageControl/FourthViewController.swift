//
//  FourthViewController.swift
//  PageControl
//
//  Created by coco on 2023/05/08.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
        
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
