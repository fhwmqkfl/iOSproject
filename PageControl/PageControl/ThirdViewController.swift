//
//  ThirdViewController.swift
//  PageControl
//
//  Created by coco on 2023/05/08.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString

    }
    
    @IBAction func backButtonTappted(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
