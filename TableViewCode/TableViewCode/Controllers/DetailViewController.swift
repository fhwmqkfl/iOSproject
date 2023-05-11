//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by coco on 2023/05/11.
//

import UIKit

final class DetailViewController: UIViewController {
    private let detailView = DetailView()
    
    var movieData: Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }

}
