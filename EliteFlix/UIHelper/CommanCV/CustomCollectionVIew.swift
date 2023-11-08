//
//  CustomCollectionVIew.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 05/11/23.
//

import Foundation
import UIKit

protocol CustomCollectionViewToViewProtocol {
    func navigateToDetails(type: String?, indexPath: IndexPath)
}

class CustomCollectionView: UIView {
    var collectionview: UICollectionView?
    var identifier: String
    var type: String?
    var viewController: CustomCollectionViewToViewProtocol?
    var data: [Codable] = []
    
    init(scrollDirection: UICollectionView.ScrollDirection, size: CGSize, cell: UICollectionViewCell.Type, identifier: String) {
        self.identifier = identifier
        super.init(frame: .zero)
        setupLayout(scrollDirection: scrollDirection, size: size)
        setupViews(cell: cell, identifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(scrollDirection: UICollectionView.ScrollDirection, size: CGSize) {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = scrollDirection
        collectionLayout.itemSize = size
        collectionLayout.minimumLineSpacing = 16
        collectionLayout.minimumInteritemSpacing = 8
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionview?.translatesAutoresizingMaskIntoConstraints = false
        collectionview?.showsVerticalScrollIndicator = false
        collectionview?.showsHorizontalScrollIndicator = false
    }
    
    private func setupViews(cell: UICollectionViewCell.Type, identifier: String) {
        guard let collectionview = collectionview else { return }
        addSubview(collectionview)
        NSLayoutConstraint.activate([
            collectionview.leftAnchor.constraint(equalTo: leftAnchor),
            collectionview.rightAnchor.constraint(equalTo: rightAnchor),
            collectionview.topAnchor.constraint(equalTo: topAnchor),
            collectionview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        collectionview.backgroundColor = .clear
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(cell, forCellWithReuseIdentifier: identifier)
    }

    func configure(viewController: CustomCollectionViewToViewProtocol? = nil, type: String? = nil, data: [Codable]) {
        self.viewController = viewController
        self.type = type
        self.data = data
        DispatchQueue.main.async { [weak self] in
            self?.collectionview?.reloadData()
        }
    }
}

extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        switch cell {
        case is CustomCollectionViewCell:
            guard let cell = cell as? CustomCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(data: data[indexPath.row])
            return cell
        case is YoutubeCollectionViewCell:
            guard let cell = cell as? YoutubeCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(data: data[indexPath.row])
            return cell
        default: return UICollectionViewCell()
           
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewController?.navigateToDetails(type: type, indexPath: indexPath)
    }
    
}
