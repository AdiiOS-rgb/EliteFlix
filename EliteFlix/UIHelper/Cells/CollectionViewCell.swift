//
//  CollectionViewCell.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 27/10/23.
//

import Foundation
import UIKit
import TinyConstraints

class CollectionViewCell: UICollectionViewCell {
    var customImageView: UIImageView!
    var movieLabel: UILabel!
    
    var popularMovieList: PopularMovies?
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }

        private func setupViews() {
            
            customImageView = UIImageView()
            customImageView.translatesAutoresizingMaskIntoConstraints = false
            customImageView.height(130)
            customImageView.width(100)
            contentView.addSubview(customImageView)
            
            movieLabel = UILabel()
            movieLabel.text = "movie"
            movieLabel.translatesAutoresizingMaskIntoConstraints = false
            movieLabel.textAlignment = .left
            movieLabel.font = UIFont(name: "Helvetica", size: 10)
            
            contentView.addSubview(movieLabel)
            customImageView.topToSuperview(offset: 15, usingSafeArea: false)
            customImageView.centerXToSuperview()
            movieLabel.topToBottom(of: customImageView, offset: 0)
            movieLabel.centerXToSuperview()
        }
    
    func configCellContent(title: String, posterPath: String) {
        movieLabel.text = "\(title)"
        customImageView.setImage(with: posterPath) 
        
    }
}
