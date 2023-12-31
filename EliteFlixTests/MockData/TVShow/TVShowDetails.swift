//
//  TVShowDetails.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//

import Foundation
@testable import EliteFlix

let tvShowsDetailsData = """
{
    "adult": false,
    "backdrop_path": "/hwUQsL1cWt0bmbTxzCompqqvTH9.jpg",
    "created_by": [
        {
            "id": 1215602,
            "credit_id": "5b9701cf0e0a26726b000e2e",
            "name": "John de Mol",
            "gender": 2,
            "profile_path": "/w6I4OZDHnSQsmpMvoRvfz1BvVpr.jpg"
        }
    ],
    "episode_run_time": [
        200
    ],
    "first_air_date": "2004-01-22",
    "genres": [
        {
            "id": 10764,
            "name": "Reality"
        }
    ],
    "homepage": "https://www.mitele.es/programas-tv/gran-hermano-vip/0000000026549",
    "id": 82250,
    "in_production": true,
    "languages": [
        "es"
    ],
    "last_air_date": "2023-11-05",
    "last_episode_to_air": {
        "id": 4863045,
        "name": "Episode 67",
        "overview": "",
        "vote_average": 0.0,
        "vote_count": 0,
        "air_date": "2023-11-05",
        "episode_number": 67,
        "episode_type": "standard",
        "production_code": "",
        "runtime": 206,
        "season_number": 8,
        "show_id": 82250,
        "still_path": "/fcO4jlTq7YUlBqD5nlg7TLYZS3s.jpg"
    },
    "name": "Gran hermano VIP",
    "next_episode_to_air": {
        "id": 4893995,
        "name": "Episode 68",
        "overview": "",
        "vote_average": 0.0,
        "vote_count": 0,
        "air_date": "2023-11-06",
        "episode_number": 68,
        "episode_type": "standard",
        "production_code": "",
        "runtime": null,
        "season_number": 8,
        "show_id": 82250,
        "still_path": null
    },
    "networks": [
        {
            "id": 378,
            "logo_path": "/pZtmQfr0z82ODDxZsqGzORZJJux.png",
            "name": "Cuatro",
            "origin_country": "ES"
        },
        {
            "id": 53,
            "logo_path": "/nSksjyoitz94qhfon6uzJj6ekj9.png",
            "name": "Telecinco",
            "origin_country": "ES"
        },
        {
            "id": 3980,
            "logo_path": "/2sMrOSRL5z5SneEjIvwRAXm8B1d.png",
            "name": "mitele",
            "origin_country": "ES"
        }
    ],
    "number_of_episodes": 264,
    "number_of_seasons": 8,
    "origin_country": [
        "ES"
    ],
    "original_language": "es",
    "original_name": "Gran hermano VIP",
    "overview": "",
    "popularity": 2055.443,
    "poster_path": "/9269PATr0bmEXKjkpR88mzGmNYI.jpg",
    "production_companies": [
        {
            "id": 52326,
            "logo_path": null,
            "name": "Zeppelin TV S.A",
            "origin_country": ""
        },
        {
            "id": 21632,
            "logo_path": "/gEto1Q487D4JPriz2qVfkkvyqjy.png",
            "name": "Mediaset España",
            "origin_country": "ES"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "ES",
            "name": "Spain"
        }
    ],
    "seasons": [
        {
            "air_date": "2004-01-22",
            "episode_count": 14,
            "id": 109113,
            "name": "Season 1",
            "overview": "",
            "poster_path": null,
            "season_number": 1,
            "vote_average": 1.0
        },
        {
            "air_date": "2005-01-06",
            "episode_count": 12,
            "id": 109126,
            "name": "Season 2",
            "overview": "",
            "poster_path": null,
            "season_number": 2,
            "vote_average": 0.0
        },
        {
            "air_date": "2015-01-11",
            "episode_count": 13,
            "id": 109127,
            "name": "Season 3",
            "overview": "",
            "poster_path": null,
            "season_number": 3,
            "vote_average": 0.0
        },
        {
            "air_date": "2016-01-07",
            "episode_count": 15,
            "id": 109128,
            "name": "Season 4",
            "overview": "",
            "poster_path": null,
            "season_number": 4,
            "vote_average": 0.0
        },
        {
            "air_date": "2017-01-08",
            "episode_count": 17,
            "id": 109129,
            "name": "Season 5",
            "overview": "",
            "poster_path": null,
            "season_number": 5,
            "vote_average": 0.0
        },
        {
            "air_date": "2018-09-12",
            "episode_count": 68,
            "id": 109130,
            "name": "Season 6",
            "overview": "",
            "poster_path": null,
            "season_number": 6,
            "vote_average": 0.0
        },
        {
            "air_date": "2019-09-11",
            "episode_count": 48,
            "id": 132158,
            "name": "Season 7",
            "overview": "",
            "poster_path": null,
            "season_number": 7,
            "vote_average": 5.0
        },
        {
            "air_date": "2023-09-14",
            "episode_count": 77,
            "id": 350526,
            "name": "Season 8",
            "overview": "",
            "poster_path": "/9269PATr0bmEXKjkpR88mzGmNYI.jpg",
            "season_number": 8,
            "vote_average": 0.0
        }
    ],
    "spoken_languages": [
        {
            "english_name": "Spanish",
            "iso_639_1": "es",
            "name": "Español"
        }
    ],
    "status": "Returning Series",
    "tagline": "",
    "type": "Scripted",
    "vote_average": 4.0,
    "vote_count": 7
}
""".data(using: .utf8)

let tvShowsDetailsResponse = try? JSONDecoder().decode(MovieAppDetails.self, from: tvShowsDetailsData!)

