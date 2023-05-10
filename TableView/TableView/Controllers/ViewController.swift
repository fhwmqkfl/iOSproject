//
//  ViewController.swift
//  TableView
//
//  Created by coco on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableVIew.dataSource = self
        tableVIew.delegate = self
        tableVIew.rowHeight = 120
        
        title = "영화목록"
        
        movieDataManager.makeMovieData()
//        moviesArray = movieDataManager.getMovieData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        tableVIew.reloadData()
        
    }
}

extension ViewController: UITableViewDataSource {
    // 각 섹션에 표시할 행의 개수를 묻는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    // 특정 위치에 표시할 셀을 요청하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let array = movieDataManager.getMovieData()
        let movie = array[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
//        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이를 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // perfom
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            let indexpath = sender as! IndexPath
            
            detailVC.movieData = array[indexpath.row]
        }
    }
}
