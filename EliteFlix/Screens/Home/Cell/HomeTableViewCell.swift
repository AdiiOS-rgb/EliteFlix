//
//  HomeTableViewCell.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 07/11/23.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = String(describing: HomeTableViewCell.self)

    private lazy var collectionView: CustomCollectionView = {
        let customCollectionView = CustomCollectionView(scrollDirection: .horizontal, size: CGSize(width: 135, height: 210), cell: CustomCollectionViewCell.self, identifier: CustomCollectionViewCell.identifier)
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return customCollectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(collectionView)
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension HomeTableViewCell {
    func configure(type: String, data: [Codable]) {
        collectionView.configure(type: type, data: data)
    }
}

