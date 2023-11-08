//
//  HomePresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 26/10/23.
//

import Foundation
import UIKit
import TinyConstraints

protocol HomeViewToPresenterProtocol {
    var viewController: HomePresenterToViewProtocol? { get set }
    func viewDidLoad()
    func numberOfSections(tableView: UITableView) -> Int
    func numberOfRowsInSection() -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func viewForHeaderInSection(tableView: UITableView, section: Int) -> UIView?
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    var interactor: HomePresenterToInteractorProtocol? { get set }
    func onFetchMoviesSuccess(type: String, data: MovieAppModel)
    func onFetchGenreSuccess(data: MovieAppGenre)
}

protocol HomePresenterProtocol {
    var router: HomePresenterToRouterProtocol { get set }
}

protocol HomeTableHeaderToPresenterProtocol {
    func filterList(type: HomeHeaderViewButtonType)
}

class HomePresenter: HomePresenterProtocol, HomeViewToPresenterProtocol, HomeInteractorToPresenterProtocol {
    var interactor: HomePresenterToInteractorProtocol?
    weak var viewController: HomePresenterToViewProtocol?
    var router: HomePresenterToRouterProtocol
    
//    private var filteredList: [MovieAppEntity] = []
//    private var homeEntityList: [MovieAppEntity] = []
//    private var homeGenreMapping: [HomeGenreMapping] = []
    
    private(set) var homeEntityList: [MovieAppEntity] = []
    private(set) var filteredList: [MovieAppEntity] = []
    private(set) var homeGenreMappingList: [HomeGenreMapping] = []
    private(set) var error: DataError?
    
    init(router: HomePresenterToRouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.fetchMovies(type: MovieT.Popular)
        interactor?.fetchMovies(type: MovieT.TopRated)
        interactor?.fetchMovies(type: MovieT.UpComing)
        interactor?.fetchMovies(type: MovieT.NowPlaying)
        interactor?.fetchGenre()
    }
    func numberOfSections(tableView: UITableView) -> Int {
        return filteredList.count
    }
    func numberOfRowsInSection() -> Int {
        return 1
    }
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        let data = filteredList[indexPath.section]
        cell.configure(type: data.type, data: data.convertToMoviesCustomCollectionViewModel())
        return cell
    }
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 210
    }
    func viewForHeaderInSection(tableView: UITableView, section: Int) -> UIView? {
        let view = HomeTableViewSectionHeaderView()
        let type = filteredList[section].type
        view.type = type
        view.viewController = viewController as? HomeTableViewSectionHeaderViewToViewProtocol
        switch type {
            case MovieT.Popular:
                view.configure(title: "Popular")
            case MovieT.TopRated:
                view.configure(title: "Top Rated")
            case MovieT.UpComing:
                view.configure(title: "Up Coming")
            case MovieT.NowPlaying:
                view.configure(title: "Now Playing")
            default:
                break
        }
        return view
    }
}

extension HomePresenter {
    func onFetchMoviesSuccess(type: String, data: MovieAppModel) {
        let record = MovieAppEntity(type: type, data: data)
        if type == MovieT.Popular {
            viewController?.configureTableHeaderView(data: convertToHomeHeaderViewData(data: data))
//            router.navigateToMovie(isNavigate: false, data: record)  // showing details of movie
        }
        homeEntityList.append(record)
        filteredList = homeEntityList
        viewController?.onFetchMoviesSuccess()
    }
    
    func onFetchGenreSuccess(data: MovieAppGenre) { // genre Mapped
        guard let genres = data.genres else { return }
        homeGenreMappingList = genres.compactMap({
            guard let id = $0.id, let name = $0.name, let type = HomeHeaderViewButtonType(rawValue: name) else { return nil }
            return HomeGenreMapping(type: type, id: id)
        })
    }
    
    private func convertToHomeHeaderViewData(data: MovieAppModel) -> HomeHeaderViewData {
        let randomIndex = Int.random(in: 0..<(data.results?.count ?? 1))
        let randomData = data.results?[randomIndex]
        let average = (randomData?.voteAverage ?? 0) / 2
        let rounded = Int(average.rounded(.down))
        let halfStar: Int = (Double(rounded) != average) ? 1 : 0
        return HomeHeaderViewData(posterPath: randomData?.backdropPath ?? "", title: randomData?.originalTitle ?? "", votes: "\(randomData?.voteCount ?? 0) votes", fullStar: rounded, halfStar: halfStar)
    }
}

extension HomePresenter: HomeTableHeaderToPresenterProtocol {
    func filterList(type: HomeHeaderViewButtonType) {
        switch type {
            case .all:
                filteredList = homeEntityList
            case .action, .crime, .horror, .thriller, .western:
                guard let id = homeGenreMappingList.first(where: { $0.type == type })?.id else { return }
                filteredList.removeAll()
                filteredList = homeEntityList.compactMap({
                    let list = $0.data?.results?.filter({ $0.genres?.contains(where: { $0 == id }) ?? false}) ?? []
                    guard !list.isEmpty else { return nil }
                    var data = $0.data
                    data?.results = list
                    return MovieAppEntity(type: $0.type, data: data)
                })
        }
        viewController?.onFetchMoviesSuccess()
    }
}
