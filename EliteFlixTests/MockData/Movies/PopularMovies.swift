//
//  PopularMovies.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let popularMovieData = """
{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
            "genre_ids": [
                27,
                9648
            ],
            "id": 507089,
            "original_language": "en",
            "original_title": "Five Nights at Freddy's",
            "overview": "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
            "popularity": 4529.373,
            "poster_path": "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
            "release_date": "2023-10-25",
            "title": "Five Nights at Freddy's",
            "video": false,
            "vote_average": 8.265,
            "vote_count": 1544
        },
        {
            "adult": false,
            "backdrop_path": "/dZbLqRjjiiNCpTYzhzL2NMvz4J0.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 951491,
            "original_language": "en",
            "original_title": "Saw X",
            "overview": "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps.",
            "popularity": 1619.014,
            "poster_path": "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg",
            "release_date": "2023-09-26",
            "title": "Saw X",
            "video": false,
            "vote_average": 7.368,
            "vote_count": 849
        },
        {
            "adult": false,
            "backdrop_path": "/eSsMzJpzAwCa69tm6Wco2il44aJ.jpg",
            "genre_ids": [
                28,
                80,
                18,
                53
            ],
            "id": 939335,
            "original_language": "en",
            "original_title": "Muzzle",
            "overview": "LAPD K-9 officer Jake Rosser has just witnessed the shocking murder of his dedicated partner by a mysterious assailant. As he investigates the shooter’s identity, he uncovers a vast conspiracy that has a chokehold on the city in this thrilling journey through the tangled streets of Los Angeles and the corrupt bureaucracy of the LAPD.",
            "popularity": 1577.455,
            "poster_path": "/qXChf7MFL36BgoLkiB3BzXiwW82.jpg",
            "release_date": "2023-09-29",
            "title": "Muzzle",
            "video": false,
            "vote_average": 6.175,
            "vote_count": 83
        },
        {
            "adult": false,
            "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
            "genre_ids": [
                28,
                80,
                53
            ],
            "id": 385687,
            "original_language": "en",
            "original_title": "Fast X",
            "overview": "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
            "popularity": 1386.067,
            "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
            "release_date": "2023-05-17",
            "title": "Fast X",
            "video": false,
            "vote_average": 7.232,
            "vote_count": 4149
        },
        {
            "adult": false,
            "backdrop_path": "/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg",
            "genre_ids": [
                28,
                53,
                80
            ],
            "id": 762430,
            "original_language": "en",
            "original_title": "Retribution",
            "overview": "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks- all with his kids trapped in the back seat.",
            "popularity": 1370.472,
            "poster_path": "/ljl70pjLIX1hx3bPyCCbxGj6WPr.jpg",
            "release_date": "2023-08-23",
            "title": "Retribution",
            "video": false,
            "vote_average": 6.961,
            "vote_count": 584
        },
        {
            "adult": false,
            "backdrop_path": "/tC78Pck2YCsUAtEdZwuHYUFYtOj.jpg",
            "genre_ids": [
                28,
                53,
                80
            ],
            "id": 926393,
            "original_language": "en",
            "original_title": "The Equalizer 3",
            "overview": "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
            "popularity": 1354.023,
            "poster_path": "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
            "release_date": "2023-08-30",
            "title": "The Equalizer 3",
            "video": false,
            "vote_average": 7.4,
            "vote_count": 1412
        },
        {
            "adult": false,
            "backdrop_path": "/gN79aDbZdaSJkFS1iVA17HplF2X.jpg",
            "genre_ids": [
                27,
                9648,
                53
            ],
            "id": 968051,
            "original_language": "en",
            "original_title": "The Nun II",
            "overview": "In 1956 France, a priest is violently murdered, and Sister Irene begins to investigate. She once again comes face-to-face with a powerful evil.",
            "popularity": 1278.698,
            "poster_path": "/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg",
            "release_date": "2023-09-06",
            "title": "The Nun II",
            "video": false,
            "vote_average": 6.944,
            "vote_count": 1327
        },
        {
            "adult": false,
            "backdrop_path": "/azD31DjpV3PJfjF3h72LVw2WCSD.jpg",
            "genre_ids": [
                27
            ],
            "id": 807172,
            "original_language": "en",
            "original_title": "The Exorcist: Believer",
            "overview": "When two girls disappear into the woods and return three days later with no memory of what happened to them, the father of one girl seeks out Chris MacNeil, who's been forever altered by what happened to her daughter fifty years ago.",
            "popularity": 1242.453,
            "poster_path": "/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg",
            "release_date": "2023-10-04",
            "title": "The Exorcist: Believer",
            "video": false,
            "vote_average": 6.118,
            "vote_count": 457
        },
        {
            "adult": false,
            "backdrop_path": "/askg3SMvhqEl4OL52YuvdtY40Yb.jpg",
            "genre_ids": [
                10751,
                16,
                14,
                10402,
                35,
                12
            ],
            "id": 354912,
            "original_language": "en",
            "original_title": "Coco",
            "overview": "Despite his family’s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel's family history.",
            "popularity": 1208.387,
            "poster_path": "/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg",
            "release_date": "2017-10-27",
            "title": "Coco",
            "video": false,
            "vote_average": 8.217,
            "vote_count": 18061
        },
        {
            "adult": false,
            "backdrop_path": "/r7DuyYJ0N3cD8bRKsR5Ygq2P7oa.jpg",
            "genre_ids": [
                12,
                28,
                18
            ],
            "id": 980489,
            "original_language": "en",
            "original_title": "Gran Turismo",
            "overview": "The ultimate wish-fulfillment tale of a teenage Gran Turismo player whose gaming skills won him a series of Nissan competitions to become an actual professional racecar driver.",
            "popularity": 1129.59,
            "poster_path": "/51tqzRtKMMZEYUpSYkrUE7v9ehm.jpg",
            "release_date": "2023-08-09",
            "title": "Gran Turismo",
            "video": false,
            "vote_average": 8.017,
            "vote_count": 1320
        },
        {
            "adult": false,
            "backdrop_path": "/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",
            "genre_ids": [
                16,
                10751,
                28,
                878
            ],
            "id": 893723,
            "original_language": "en",
            "original_title": "PAW Patrol: The Mighty Movie",
            "overview": "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.",
            "popularity": 1129.57,
            "poster_path": "/aTvePCU7exLepwg5hWySjwxojQK.jpg",
            "release_date": "2023-09-21",
            "title": "PAW Patrol: The Mighty Movie",
            "video": false,
            "vote_average": 6.932,
            "vote_count": 118
        },
        {
            "adult": false,
            "backdrop_path": "/628Dep6AxEtDxjZoGP78TsOxYbK.jpg",
            "genre_ids": [
                28,
                53
            ],
            "id": 575264,
            "original_language": "en",
            "original_title": "Mission: Impossible - Dead Reckoning Part One",
            "overview": "Ethan Hunt and his IMF team embark on their most dangerous mission yet: To track down a terrifying new weapon that threatens all of humanity before it falls into the wrong hands. With control of the future and the world's fate at stake and dark forces from Ethan's past closing in, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan must consider that nothing can matter more than his mission—not even the lives of those he cares about most.",
            "popularity": 1085.398,
            "poster_path": "/NNxYkU70HPurnNCSiCjYAmacwm.jpg",
            "release_date": "2023-07-08",
            "title": "Mission: Impossible - Dead Reckoning Part One",
            "video": false,
            "vote_average": 7.71,
            "vote_count": 2055
        },
        {
            "adult": false,
            "backdrop_path": "/wl4NWiZwpzZH67HiDgpDImLyds9.jpg",
            "genre_ids": [
                28,
                12,
                53
            ],
            "id": 299054,
            "original_language": "en",
            "original_title": "Expend4bles",
            "overview": "Armed with every weapon they can get their hands on and the skills to use them, The Expendables are the world’s last line of defense and the team that gets called when all other options are off the table. But new team members with new styles and tactics are going to give “new blood” a whole new meaning.",
            "popularity": 1067.026,
            "poster_path": "/iwsMu0ehRPbtaSxqiaUDQB9qMWT.jpg",
            "release_date": "2023-09-15",
            "title": "Expend4bles",
            "video": false,
            "vote_average": 6.521,
            "vote_count": 593
        },
        {
            "adult": false,
            "backdrop_path": "/pA3vdhadJPxF5GA1uo8OPTiNQDT.jpg",
            "genre_ids": [
                28,
                18
            ],
            "id": 678512,
            "original_language": "en",
            "original_title": "Sound of Freedom",
            "overview": "The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.",
            "popularity": 925.953,
            "poster_path": "/qA5kPYZA7FkVvqcEfJRoOy4kpHg.jpg",
            "release_date": "2023-07-03",
            "title": "Sound of Freedom",
            "video": false,
            "vote_average": 8.131,
            "vote_count": 1167
        },
        {
            "adult": false,
            "backdrop_path": "/kHlX3oqdD4VGaLpB8O78M25KfdS.jpg",
            "genre_ids": [
                9648,
                53,
                80
            ],
            "id": 945729,
            "original_language": "en",
            "original_title": "A Haunting in Venice",
            "overview": "Celebrated sleuth Hercule Poirot, now retired and living in self-imposed exile in Venice, reluctantly attends a Halloween séance at a decaying, haunted palazzo. When one of the guests is murdered, the detective is thrust into a sinister world of shadows and secrets.",
            "popularity": 833.745,
            "poster_path": "/1Xgjl22MkAZQUavvOeBqRehrvqO.jpg",
            "release_date": "2023-09-13",
            "title": "A Haunting in Venice",
            "video": false,
            "vote_average": 6.826,
            "vote_count": 915
        },
        {
            "adult": false,
            "backdrop_path": "/lyHmhoRj3zXSdeCYbs2oOXLCF4K.jpg",
            "genre_ids": [
                16,
                12,
                10751,
                14
            ],
            "id": 459003,
            "original_language": "uk",
            "original_title": "Мавка: Лісова пісня",
            "overview": "Forest soul Mavka faces an impossible choice between her heart and her duty as guardian to the Heart of the Forest, when she falls in love with the talented young human musician Lukas.",
            "popularity": 803.42,
            "poster_path": "/eeJjd9JU2Mdj9d7nWRFLWlrcExi.jpg",
            "release_date": "2023-03-02",
            "title": "Mavka: The Forest Song",
            "video": false,
            "vote_average": 7.274,
            "vote_count": 462
        },
        {
            "adult": false,
            "backdrop_path": "/5mzr6JZbrqnqD8rCEvPhuCE5Fw2.jpg",
            "genre_ids": [
                28,
                878,
                27
            ],
            "id": 615656,
            "original_language": "en",
            "original_title": "Meg 2: The Trench",
            "overview": "An exploratory dive into the deepest depths of the ocean of a daring research team spirals into chaos when a malevolent mining operation threatens their mission and forces them into a high-stakes battle for survival.",
            "popularity": 774.248,
            "poster_path": "/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg",
            "release_date": "2023-08-02",
            "title": "Meg 2: The Trench",
            "video": false,
            "vote_average": 6.777,
            "vote_count": 2442
        },
        {
            "adult": false,
            "backdrop_path": "/h7BoGo4NhckWRiMUCi3Qr8GwBDA.jpg",
            "genre_ids": [
                28,
                80,
                18,
                53
            ],
            "id": 1039690,
            "original_language": "en",
            "original_title": "Desperation Road",
            "overview": "After 11 years in a Mississippi state prison, Russell Gaines struggles to leave his past sins behind him as he returns home to his stoic father, Mitchell. One fateful night he meets Maben, a young mother with nothing but a stolen gun and a murdered police deputy to her name. Desperate and on the run, Russell and Maben must trust one another to escape their own circumstances, before the truths of their intertwined violent past threatens to destroy them.",
            "popularity": 765.941,
            "poster_path": "/tPyj6Gii1HrnzCbJXEF7JdSFkQ8.jpg",
            "release_date": "2023-10-19",
            "title": "Desperation Road",
            "video": false,
            "vote_average": 7.279,
            "vote_count": 43
        },
        {
            "adult": false,
            "backdrop_path": "/bGQyu8H6q20ZRxqr3z65kE17QPA.jpg",
            "genre_ids": [
                28,
                53
            ],
            "id": 1171541,
            "original_language": "en",
            "original_title": "Sniper: G.R.I.T. - Global Response & Intelligence Team",
            "overview": "When an international terrorist cult threatens global political stability and kidnaps a fellow agent, Ace Sniper Brandon Beckett and the newly-formed Global Response & Intelligence Team – or G.R.I.T. – led by Colonel Stone must travel across the world to Malta, infiltrate the cult, and take out its leader to free Lady Death and stop the global threat.",
            "popularity": 711.838,
            "poster_path": "/a9bt9byTQ1MIfRWYQX240HiYPrl.jpg",
            "release_date": "2023-09-26",
            "title": "Sniper: G.R.I.T. - Global Response & Intelligence Team",
            "video": false,
            "vote_average": 6.972,
            "vote_count": 71
        },
        {
            "adult": false,
            "backdrop_path": "/3H9NA1KWEQN0ItL3Wl3SFZYP6yV.jpg",
            "genre_ids": [
                28,
                878,
                12
            ],
            "id": 565770,
            "original_language": "en",
            "original_title": "Blue Beetle",
            "overview": "Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that home is not quite as he left it. As he searches to find his purpose in the world, fate intervenes when Jaime unexpectedly finds himself in possession of an ancient relic of alien biotechnology: the Scarab.",
            "popularity": 693.361,
            "poster_path": "/mXLOHHc1Zeuwsl4xYKjKh2280oL.jpg",
            "release_date": "2023-08-16",
            "title": "Blue Beetle",
            "video": false,
            "vote_average": 7.0,
            "vote_count": 1484
        }
    ],
    "total_pages": 41169,
    "total_results": 823375
}
""".data(using: .utf8)

let popularMovieResponse = try? JSONDecoder().decode(MovieAppModel.self, from: popularMovieData!)
