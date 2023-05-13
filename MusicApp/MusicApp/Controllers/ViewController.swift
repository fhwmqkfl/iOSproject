//
//  ViewController.swift
//  MusicApp
//
//  Created by coco on 2023/05/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    
    // (음악 데이터를 다루기 위함) 빈배열로 시작
    var musicArrays: [Music] = []
    
    var networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Hello"
        setupDatas()
    }
    
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        // Nib파일을 사용한다면 등록의 과정이 필요
        
//        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)

    }
    
    func setupDatas() {
        // 네트워킹의 시작
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            print(#function)
            switch result {
            case .success(let musicDatas):
                // 데이터(배열)을 받아오고 난 후
                self.musicArrays = musicDatas
                // 테이블뷰 리로드
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        cell.imageUrl = musicArrays[indexPath.row].imageUrl
        
        cell.songNameLabel.text = musicArrays[indexPath.row].songName
        cell.artistNameLabel.text = musicArrays[indexPath.row].artistName
        cell.albumNameLabel.text = musicArrays[indexPath.row].albumName
        cell.releaseDateLabel.text = musicArrays[indexPath.row].releaseDateString
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}
