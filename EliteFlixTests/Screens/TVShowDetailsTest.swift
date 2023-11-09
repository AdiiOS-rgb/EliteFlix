//
//  TVShowDetailsTest.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//

import XCTest
@testable import EliteFlix

final class TvShowsDetailsTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFetchTvShowsDetailsSuccess() {
        let tvShowsId = 82250
        let presenter = TVDetailsPresenter(router: TVDetailsRouter(), tvShowsId: tvShowsId)
        let interactor = TVDetailInteractor(repository: TvShowsRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppDetails.self)
        
        let data = presenter.tvShowsDetails
        let error = presenter.error
        
        XCTAssertNotNil(data, "TvShowsDetails data is nil while executing TvShowsDetailsInteractor -> fetchTvShowsDetails()")
        XCTAssertEqual(tvShowsId, data?.id, "MovieDetails data is not matching with expected result while executing TvShowsDetailsInteractor -> fetchTvShowsDetails()")
        XCTAssertNil(error, "Error while executing TvShowsDetailsInteractor -> fetchTvShowsDetails()")
    }
    
}

