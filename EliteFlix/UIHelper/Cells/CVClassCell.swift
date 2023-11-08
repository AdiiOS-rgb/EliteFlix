//
//  CVClassCell.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit
import TinyConstraints

class CVClassCell: UICollectionViewCell {

    static let Identifier = CollectionViewCell.description()

    private var moviePoster: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private var movieTitle: UILabel = UILabel().setLabel(text: "Name",
                                                textColor: .white,
                                                bgColor: nil,
                                                font: AppTheme.cellLabelFont)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(moviePoster)
        contentView.addSubview(movieTitle)
        movieTitle.textAlignment = .left
    }
    
    private func setupConstraint() {
        
        moviePoster.top(to: contentView)
        moviePoster.left(to: contentView)
        moviePoster.right(to: contentView)
        moviePoster.height(contentView.frame.height - 20) 

        movieTitle.topToBottom(of: moviePoster)
        movieTitle.left(to: contentView)
        movieTitle.right(to: contentView)
        movieTitle.bottom(to: contentView)
    }
    
    func SetCVCell(title: String, posterPath: String?) {
        movieTitle.text = " \(title)"
        moviePoster.setImage(with: posterPath)
       
    }
}
extension UILabel {
    func setLabel(text: String, textColor: UIColor, bgColor: UIColor?, font: UIFont?) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.textColor = textColor
        
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 1
        
        if let bgColor = bgColor {
            label.backgroundColor = bgColor
        }
        
        if let font = font {
            label.font =  font
        }
        
        return label
    }

}
