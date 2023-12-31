//
//  EliteFlixTests.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 20/10/23.
//

import XCTest
@testable import EliteFlix

final class HomeTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchMoviesSuccess() {
        let presenter = HomePresenter(router: HomeRouter())
        let interactor = HomeInteractor(movieRepository: MovieRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.fetchMovies(type: MovieT.Popular)
        
        let data = presenter.homeEntityList.first(where: { $0.type == MovieT.Popular })?.data
        let error = presenter.error
        
        XCTAssertNotNil(data, "Movie data is nil while executing HomeInteractor -> fetchMovies()")
        XCTAssertGreaterThan(data?.results?.count ?? 0, 0, "Movie list is empty  while executing HomeInteractor -> fetchMovies()")
        XCTAssertNil(error, "Error while executing HomeInteractor -> fetchMovies()")
    }
    
    func testFetchGenreSuccess() {
        let presenter = HomePresenter(router: HomeRouter())
        let interactor = HomeInteractor(movieRepository: MovieRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.fetchGenre()
        
        let data = presenter.homeGenreMappingList
        let error = presenter.error
        
        XCTAssertNotNil(data, "Genre data is nil while executing HomeInteractor -> fetchGenre()")
        XCTAssertGreaterThan(data.count, 0, "Genre list is empty  while executing HomeInteractor -> fetchMovies()")
        XCTAssertNil(error, "Error while executing HomeInteractor -> fetchGenre()")
    }
}
