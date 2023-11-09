//
//  TVShowCast.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//

import Foundation
@testable import EliteFlix

let tvShowsCastData = """
{
    "cast": [
        {
            "adult": false,
            "gender": 0,
            "id": 4185519,
            "known_for_department": "Acting",
            "name": "Marta Flich",
            "original_name": "Marta Flich",
            "popularity": 0.98,
            "profile_path": null,
            "character": "Presentadora",
            "credit_id": "65077d7dfa27f400ae9ed465",
            "order": 36
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2939955,
            "known_for_department": "Acting",
            "name": "Ion Aramendi",
            "original_name": "Ion Aramendi",
            "popularity": 0.704,
            "profile_path": "/lgVXJ1CJSBCnx8YC7O4jpUk1shK.jpg",
            "character": "Presentador (El Debate)",
            "credit_id": "651c794f0721660139c6fc20",
            "order": 37
        },
        {
            "adult": false,
            "gender": 1,
            "id": 2013347,
            "known_for_department": "Acting",
            "name": "Lara Álvarez",
            "original_name": "Lara Álvarez",
            "popularity": 1.386,
            "profile_path": "/8MpDnPNTQuudL4AunlCO4kc5053.jpg",
            "character": "Presentadora (Última hora)",
            "credit_id": "651c7961c50ad200eabff8bb",
            "order": 38
        }
    ],
    "crew": [],
    "id": 82250
}
""".data(using: .utf8)

let tvShowsCastResponse = try? JSONDecoder().decode(MovieAppCast.self, from: tvShowsCastData!)

