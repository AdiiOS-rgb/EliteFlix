//
//  TableHeaderView.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 07/11/23.
//

import Foundation
import UIKit

enum HomeHeaderViewButtonType: String, CaseIterable {
    case all = "All"
    case action = "Action"
    case crime = "Crime"
    case horror = "Horror"
    case thriller = "Thriller"
    case western = "Western"
}

class HomeTableHeaderView: UIView {
    var presenter: HomeTableHeaderToPresenterProtocol?
    
    private lazy var posterView: UIImageView = {
        let posterView = UIImageView()
        posterView.translatesAutoresizingMaskIntoConstraints = false
        return posterView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Sample"
        label.font = .systemFont(ofSize: 36)
        return label
    }()
    
    private lazy var starView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var voteLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var starStackGroup: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [starView, voteLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 10
        stackview.alignment = .center
        return stackview
    }()
    
    private lazy var buttonStackGroup: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        setupButtonStackView(stackView: stackView)
        return stackView
    }()
    
    private lazy var verticalStackGroup: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, starStackGroup])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var buttonScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(posterView)
        addSubview(verticalStackGroup)
        addSubview(buttonScrollView)
        buttonScrollView.addSubview(buttonStackGroup)
        
        NSLayoutConstraint.activate([
            posterView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            posterView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            posterView.topAnchor.constraint(equalTo: topAnchor),
            
            verticalStackGroup.topAnchor.constraint(equalTo: posterView.bottomAnchor),
            verticalStackGroup.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8),
            verticalStackGroup.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8),
            
            buttonScrollView.topAnchor.constraint(equalTo: verticalStackGroup.bottomAnchor, constant: 16),
            buttonScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            buttonScrollView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8),
            buttonScrollView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8),
            buttonScrollView.heightAnchor.constraint(equalTo: buttonStackGroup.heightAnchor),
            
            buttonStackGroup.leftAnchor.constraint(equalTo: buttonScrollView.leftAnchor),
            buttonStackGroup.rightAnchor.constraint(equalTo: buttonScrollView.rightAnchor),
            buttonStackGroup.topAnchor.constraint(equalTo: buttonScrollView.topAnchor),
            buttonStackGroup.bottomAnchor.constraint(equalTo: buttonScrollView.bottomAnchor),
            
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension HomeTableHeaderView {
    func configure(data: HomeHeaderViewData) {
        if data.posterPath.isEmpty {
            posterView.image = UIImage(named: "imageError")
        } else {
            let posterEndPoint = "\(Constants.imagePath)\(data.posterPath)"
            posterView.setImage(with: posterEndPoint)
        }
        titleLabel.text = data.title
        voteLabel.text = data.votes
        starView.createStarView(full: data.fullStar, half: data.halfStar)
    }
    
    private func setupButtonStackView(stackView: UIStackView) {
        let font: UIFont = .systemFont(ofSize: 20, weight: .bold)
        
        for type in HomeHeaderViewButtonType.allCases {
            let title = type.rawValue
            let buttonView = Button(title: title, color: type == .all ? .white : .black, font: font, width: 120, backgrounColor: type == .all ? ColorTheme.DarkVioletColor: .white)
            buttonView.translatesAutoresizingMaskIntoConstraints = false
            buttonView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(buttonView)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text, let type = HomeHeaderViewButtonType(rawValue: text) else { return }
        buttonStackGroup.arrangedSubviews.forEach({ button in
            guard let button = button as? UIButton else { return }
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
        })
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = ColorTheme.DarkVioletColor
        presenter?.filterList(type: type)
    }
}
