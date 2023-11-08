//
//  MainCollectionView.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 30/10/23.
//

import Foundation
import UIKit

protocol CommanCVToPresenter {
    func selectedItem(indexPath: IndexPath, id: Int?)
}

class MainCollectionView: UIView {
    var collectionView: UICollectionView!
    var list: [Codable] = []
    var delegate: CommanCVToPresenter?
    init(scrollDirection: UICollectionView.ScrollDirection) {
        super.init(frame: .zero)
        SetupUI(scrollDirection: scrollDirection)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetupUI(scrollDirection: UICollectionView.ScrollDirection) {
        let Layout = UICollectionViewFlowLayout()
        Layout.scrollDirection = scrollDirection
        Layout.itemSize = CGSize(width: 120, height: 180)
        Layout.minimumLineSpacing = 4
        Layout.minimumInteritemSpacing = 4
        Layout.sectionInset  = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: Layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CVClassCell.self, forCellWithReuseIdentifier: CVClassCell.Identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
    }
    func setupConstraints() {
        collectionView.top(to: self.safeAreaLayoutGuide)
        collectionView.left(to: self.safeAreaLayoutGuide)
        collectionView.right(to: self.safeAreaLayoutGuide)
        collectionView.bottom(to: self.safeAreaLayoutGuide)
    }
    
    func setVCData(List: [Codable], delegate: CommanCVToPresenter) {
        self.list = List
        self.delegate = delegate
    }
}

extension MainCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVClassCell.Identifier, for: indexPath) as? CVClassCell else {
            return UICollectionViewCell() }
        
        if let data = list as? [CustomObj] {
            cell.SetCVCell(title: data[indexPath.row].title ?? "Movie", posterPath: data[indexPath.row].posterPath ?? "Url")
        }
        return cell
    }    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = list as? [CustomObj]
        let showId = data?[indexPath.row].id
        delegate?.selectedItem(indexPath: indexPath, id: showId)
    }
    
}
