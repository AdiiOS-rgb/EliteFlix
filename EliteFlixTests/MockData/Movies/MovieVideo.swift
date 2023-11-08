//
//  MovieVideo.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let movieVideoData = """
{
    "id": 605116,
    "results": [
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Comic-Con Project Power Clip: Joseph Gordon Levitt is Bulletproof | Netflix",
            "key": "KZOdwr0zp1M",
            "site": "YouTube",
            "size": 1080,
            "type": "Clip",
            "official": true,
            "published_at": "2020-07-24T18:15:00.000Z",
            "id": "5f1b6d501b1f3c00386e867d"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Project Power starring Jamie Foxx | Official Trailer | Netflix",
            "key": "xw1vQgVaYNQ",
            "site": "YouTube",
            "size": 1080,
            "type": "Trailer",
            "official": true,
            "published_at": "2020-07-15T14:00:00.000Z",
            "id": "5f0f0e369672ed00364c4619"
        }
    ]
}
""".data(using: .utf8)

let movieVideoResponse = try? JSONDecoder().decode(MovieAppVideo.self, from: movieVideoData!)

