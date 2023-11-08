//
//  TableSecHeaderView.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 07/11/23.
//

import Foundation
import UIKit

class HomeTableViewSectionHeaderView: UIView {
    var type: String?
    var viewController: HomeTableViewSectionHeaderViewToViewProtocol?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private lazy var buttonView: UIButton = {
        let button = Button(title: "Show All", color: .white, font: .systemFont(ofSize: 18))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(buttonView)
        backgroundColor = .black
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            buttonView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8),
            buttonView.topAnchor.constraint(equalTo: topAnchor),
            buttonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let type = type else { return }
        viewController?.navigateToMovie(type: type)
    }
}
