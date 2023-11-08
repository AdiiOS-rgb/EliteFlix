//
//  CustomCollViewCell.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 05/11/23.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CustomCollectionViewCell.self)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 16
        clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            imageView.heightAnchor.constraint(equalToConstant: 170),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(data: Codable) {
        guard let data = data as? CustomCollectionViewModel else { return }
        if data.posterPath.isEmpty {
            imageView.image = UIImage(named: "imageError")
        } else {
            let path = "\(Constants.imagePath)\(data.posterPath)"
            imageView.setImage(with: path)
        }
        if data.title.isEmpty {
            titleLabel.removeFromSuperview()
        } else {
            titleLabel.text = data.title
        }
    }
}
