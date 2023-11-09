//
//  KnownFor.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let movieKnownForData = """
{
    "cast": [
        {
            "adult": true,
            "backdrop_path": null,
            "genre_ids": [
                16
            ],
            "id": 1020838,
            "original_language": "ja",
            "original_title": "鬼作令和版",
            "overview": "",
            "popularity": 0.0,
            "poster_path": "/yGaitquvlSPTgFD53ljV3L4MIno.jpg",
            "release_date": "2022-08-26",
            "title": "鬼作令和版",
            "video": false,
            "vote_average": 6.0,
            "vote_count": 1,
            "character": "",
            "credit_id": "6315e6ce5507e9007ac193fa",
            "order": 0
        }
    ],
    "crew": [],
    "id": 1937988
}
""".data(using: .utf8)

let movieKnownForResponse = try? JSONDecoder().decode(MovieAppKnownFor.self, from: movieKnownForData!)

