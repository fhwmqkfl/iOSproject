//
//  ViewController.swift
//  TableView
//
//  Created by coco on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableVIew.dataSource = self
    }


}


extension ViewController: UITableViewDataSource {
    // 각 섹션에 표시할 행의 개수를 묻는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    // 특정 위치에 표시할 셀을 요청하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        return UITableViewCell()
    }
    
    
}
