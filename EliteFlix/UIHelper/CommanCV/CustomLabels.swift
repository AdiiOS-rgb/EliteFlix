//
//  CustomLabels.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 02/11/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    func configure(data: DetailsEntity)
}

class CustomLabels: UIView {
    private lazy var posterHeaderView: UIImageView = {
        let posterView = UIImageView()
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.contentMode = .scaleToFill
        return posterView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
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
    
    private lazy var descriptionGroup: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, genreLabel, starStackGroup])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.tintColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var durationEpisodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.tintColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var localeSeasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.tintColor = .white
        return label
    }()
    
    private lazy var releaseGroup: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [releaseDateLabel, durationEpisodeLabel, localeSeasonLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 2
        stackview.alignment = .leading
        return stackview
    }()
    
    private lazy var descriptionReleaseGroup: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var overviewGroup: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [posterHeaderView, descriptionReleaseGroup, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(overviewGroup)
        descriptionReleaseGroup.addSubview(descriptionGroup)
        descriptionReleaseGroup.addSubview(releaseGroup)
        
        NSLayoutConstraint.activate([
            overviewGroup.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            overviewGroup.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            overviewGroup.topAnchor.constraint(equalTo: topAnchor),
            overviewGroup.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            posterHeaderView.heightAnchor.constraint(equalToConstant: 200),
            descriptionGroup.leftAnchor.constraint(equalTo: descriptionReleaseGroup.leftAnchor),
            descriptionGroup.topAnchor.constraint(equalTo: descriptionReleaseGroup.topAnchor),
            descriptionGroup.bottomAnchor.constraint(equalTo: descriptionReleaseGroup.bottomAnchor, constant: -16),
            descriptionGroup.rightAnchor.constraint(lessThanOrEqualTo: releaseGroup.leftAnchor),
            releaseGroup.rightAnchor.constraint(equalTo: descriptionReleaseGroup.rightAnchor),
            releaseGroup.topAnchor.constraint(equalTo: descriptionReleaseGroup.topAnchor),
            releaseGroup.bottomAnchor.constraint(lessThanOrEqualTo: descriptionReleaseGroup.bottomAnchor),
            descriptionReleaseGroup.widthAnchor.constraint(equalTo: overviewGroup.widthAnchor)
        ])
    }
}

extension CustomLabels: DetailViewProtocol {
    func configure(data: DetailsEntity) {
        guard let imagePath = data.posterImage  else { return }
        let imageEndPoint = "\(TVConstants.imagePath)\(imagePath)"
        posterHeaderView.setImage(with: imageEndPoint)
        titleLabel.text = data.title
        genreLabel.text = data.genres
        voteLabel.text = data.votes
//        starView.createStarView(full: data.fullStar, half: data.halfStar)
        releaseDateLabel.leftImageText(image: UIImage(named: data.releaseDateImage), text: data.releaseDate)
        durationEpisodeLabel.leftImageText(image: UIImage(named: data.durationEpisodesImage), text: data.durationEpisodes)
        localeSeasonLabel.leftImageText(image: UIImage(named: data.localeSeasonsImage), text: data.localeSeasons)
        descriptionLabel.text = data.description
    }
}
