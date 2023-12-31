//
//  MovieDetails.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let movieDetailsData = """
{
    "adult": false,
    "backdrop_path": "/qVygtf2vU15L2yKS4Ke44U4oMdD.jpg",
    "belongs_to_collection": null,
    "budget": 0,
    "genres": [
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 878,
            "name": "Science Fiction"
        }
    ],
    "homepage": "http://www.netflix.com/projectpower",
    "id": 605116,
    "imdb_id": "tt7550000",
    "original_language": "en",
    "original_title": "Project Power",
    "overview": "An ex-soldier, a teen and a cop collide in New Orleans as they hunt for the source behind a dangerous new pill that grants users temporary superpowers.",
    "popularity": 24.126,
    "poster_path": "/TnOeov4w0sTtV2gqICqIxVi74V.jpg",
    "production_companies": [
        {
            "id": 102118,
            "logo_path": null,
            "name": "Screen Arcade",
            "origin_country": "US"
        },
        {
            "id": 71895,
            "logo_path": null,
            "name": "Supermarché",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2020-08-14",
    "revenue": 0,
    "runtime": 113,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        },
        {
            "english_name": "Hindi",
            "iso_639_1": "hi",
            "name": "हिन्दी"
        },
        {
            "english_name": "Portuguese",
            "iso_639_1": "pt",
            "name": "Português"
        }
    ],
    "status": "Released",
    "tagline": "What would you risk for five minutes of pure power?",
    "title": "Project Power",
    "video": false,
    "vote_average": 6.478,
    "vote_count": 2652
}
""".data(using: .utf8)

let movieDetailsResponse = try? JSONDecoder().decode(MovieAppDetails.self, from: movieDetailsData!)

