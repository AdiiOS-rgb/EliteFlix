//
//  TVShowVideos.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//

import Foundation
@testable import EliteFlix

let tvShowsVideoData = """
{
    "id": 4588,
    "results": [
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "ER (TV Series 1994-2009), 15 Seasons, 331 Episodes",
            "key": "9OaqCth__lQ",
            "published_at": "2015-04-15T20:00:54.000Z",
            "site": "YouTube",
            "size": 480,
            "type": "Opening Credits",
            "official": false,
            "id": "5b1a35229251414bcd00e4f3"
        },
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "ER Trailer Season 1",
            "key": "q6Qgrb8lP4k",
            "published_at": "2011-08-15T06:12:41.000Z",
            "site": "YouTube",
            "size": 480,
            "type": "Trailer",
            "official": false,
            "id": "5b1a34d60e0a261fa701000a"
        }
    ]
}
""".data(using: .utf8)

let tvShowsVideoResponse = try? JSONDecoder().decode(MovieAppVideo.self, from: tvShowsVideoData!)

