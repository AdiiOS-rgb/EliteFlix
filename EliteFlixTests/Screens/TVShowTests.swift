//
//  TVShowTests.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//

import XCTest
@testable import EliteFlix

final class TvShowsTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFetchTvShowsSuccess() {
        let presenter = TVPresenter()
        let interactor = TVInteractor(repository: TvShowsRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.getTopRatedMovies()
        
        let data = presenter.popularTVShowsList
        let error = presenter.error
        
        XCTAssertNotNil(data, "TvShows data is nil while executing TvShowsInteractor -> fetchTvShows()")
        XCTAssertGreaterThan(data?.list?.count ?? 0, 0, "TvShows list is empty  while executing TvShowsInteractor -> fetchTvShows()")
        XCTAssertNil(error, "Error while executing TvShowsInteractor -> fetchTvShows()")
    }
    

}

