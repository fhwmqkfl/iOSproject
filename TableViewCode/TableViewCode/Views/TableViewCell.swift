//
//  TableViewCell.swift
//  TableViewCode
//
//  Created by coco on 2023/05/11.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    var movieNameLabel = UILabel()
    var mainImageView = UIImageView()
    var descriptionLabel = UILabel()
    
    let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func makeUI() {
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0
        
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution  = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        self.addSubview(mainImageView)
        self.addSubview(stackView)

        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
    }

    func setConstraints() {
        setMainImageViewConstraints()
        setMovieNameLabelConstraints()
        setStackViewConstraints()
    }

    func setMainImageViewConstraints() {

        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func setMovieNameLabelConstraints() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }

    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
}
