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

    // 🍏 서치 컨트롤러 생성 ===> 네비게이션 아이템에 할당
//    let searchController = UISearchController()
    
    // 🍎 서치 Results컨트롤러 ⭐️
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello"
        setupTableView()
        setupDatas()
        setupSearchBar()
    }
    
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        // Nib파일을 사용한다면 등록의 과정이 필요
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)

    }
    
    func setupDatas() {
        // 네트워킹의 시작
        networkManager.fetchMusic(searchTerm: "jazz") { result in
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
    
    func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        
        // 🍏 1) (단순)서치바의 사용
        //searchController.searchBar.delegate = self
        
        
        // 🍎 2) 서치(결과)컨트롤러의 사용 (복잡한 구현 가능)
        //     ==> 글자마다 검색 기능 + 새로운 화면을 보여주는 것도 가능
        searchController.searchResultsUpdater = self
        
        // 첫글자 대문자 설정 없애기
        searchController.searchBar.autocapitalizationType = .none
    }
    
    

}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicArrays.count
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

//extension ViewController: UISearchBarDelegate {
//
//    // 방법 1. 유저가 글자를 입력하는 순간마다 호출되는 메서드
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        print(searchText)
//        // 다시 빈 배열로 만들기 ⭐️
//        self.musicArrays = []
//
//        // 네트워킹 시작
//        networkManager.fetchMusic(searchTerm: searchText) { result in
//            switch result {
//            case .success(let musicDatas):
//                self.musicArrays = musicDatas
//                DispatchQueue.main.async {
//                    self.musicTableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    // 방법 2. 검색(Search) 버튼을 눌렀을때 호출되는 메서드
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//        print(text)
//        // 다시 빈 배열로 만들기 ⭐️
//        self.musicArrays = []
//
//        // 네트워킹 시작
//        networkManager.fetchMusic(searchTerm: text) { result in
//            switch result {
//            case .success(let musicDatas):
//                self.musicArrays = musicDatas
//                DispatchQueue.main.async {
//                    self.musicTableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        self.view.endEditing(true)
//    }
//}


//MARK: -  🍎 검색하는 동안 (새로운 화면을 보여주는) 복잡한 내용 구현 가능
extension ViewController: UISearchResultsUpdating {
    // 유저가 글자를 입력하는 순간마다 호출되는 메서드 ===> 일반적으로 다른 화면을 보여줄때 구현
    func updateSearchResults(for searchController: UISearchController) {
        print("서치바에 입력되는 단어", searchController.searchBar.text ?? "")
        // 글자를 치는 순간에 다른 화면을 보여주고 싶다면 (컬렉션뷰를 보여줌)
        let vc = searchController.searchResultsController as! SearchResultViewController
        // 컬렉션뷰에 찾으려는 단어 전달
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
}
