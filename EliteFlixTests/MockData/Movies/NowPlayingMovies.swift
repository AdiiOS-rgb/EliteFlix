//
//  NowPlayingMovies.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let nowPlayingMovieData = """
{
    "dates": {
        "maximum": "2023-11-08",
        "minimum": "2023-09-27"
    },
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
            "popularity": 4546.19,
            "poster_path": "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
            "release_date": "2023-10-25",
            "title": "Five Nights at Freddy's",
            "video": false,
            "vote_average": 8.264,
            "vote_count": 1580
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
            "popularity": 1839.58,
            "poster_path": "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg",
            "release_date": "2023-09-26",
            "title": "Saw X",
            "video": false,
            "vote_average": 7.371,
            "vote_count": 863
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
            "popularity": 1864.674,
            "poster_path": "/qXChf7MFL36BgoLkiB3BzXiwW82.jpg",
            "release_date": "2023-09-29",
            "title": "Muzzle",
            "video": false,
            "vote_average": 6.214,
            "vote_count": 84
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
            "popularity": 1631.532,
            "poster_path": "/ljl70pjLIX1hx3bPyCCbxGj6WPr.jpg",
            "release_date": "2023-08-23",
            "title": "Retribution",
            "video": false,
            "vote_average": 6.978,
            "vote_count": 588
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
            "popularity": 1590.991,
            "poster_path": "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
            "release_date": "2023-08-30",
            "title": "The Equalizer 3",
            "video": false,
            "vote_average": 7.384,
            "vote_count": 1425
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
            "popularity": 1516.176,
            "poster_path": "/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg",
            "release_date": "2023-09-06",
            "title": "The Nun II",
            "video": false,
            "vote_average": 6.936,
            "vote_count": 1332
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
            "popularity": 1416.812,
            "poster_path": "/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg",
            "release_date": "2023-10-04",
            "title": "The Exorcist: Believer",
            "video": false,
            "vote_average": 6.12,
            "vote_count": 464
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
            "popularity": 1046.715,
            "poster_path": "/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg",
            "release_date": "2017-10-27",
            "title": "Coco",
            "video": false,
            "vote_average": 8.217,
            "vote_count": 18065
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
            "popularity": 1041.962,
            "poster_path": "/aTvePCU7exLepwg5hWySjwxojQK.jpg",
            "release_date": "2023-09-21",
            "title": "PAW Patrol: The Mighty Movie",
            "video": false,
            "vote_average": 6.932,
            "vote_count": 118
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
            "popularity": 1198.53,
            "poster_path": "/iwsMu0ehRPbtaSxqiaUDQB9qMWT.jpg",
            "release_date": "2023-09-15",
            "title": "Expend4bles",
            "video": false,
            "vote_average": 6.5,
            "vote_count": 594
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
            "popularity": 1056.898,
            "poster_path": "/qA5kPYZA7FkVvqcEfJRoOy4kpHg.jpg",
            "release_date": "2023-07-03",
            "title": "Sound of Freedom",
            "video": false,
            "vote_average": 8.152,
            "vote_count": 1187
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
            "popularity": 881.89,
            "poster_path": "/eeJjd9JU2Mdj9d7nWRFLWlrcExi.jpg",
            "release_date": "2023-03-02",
            "title": "Mavka: The Forest Song",
            "video": false,
            "vote_average": 7.28,
            "vote_count": 463
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
            "popularity": 880.819,
            "poster_path": "/tPyj6Gii1HrnzCbJXEF7JdSFkQ8.jpg",
            "release_date": "2023-10-19",
            "title": "Desperation Road",
            "video": false,
            "vote_average": 7.279,
            "vote_count": 43
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
            "popularity": 799.542,
            "poster_path": "/mXLOHHc1Zeuwsl4xYKjKh2280oL.jpg",
            "release_date": "2023-08-16",
            "title": "Blue Beetle",
            "video": false,
            "vote_average": 7.003,
            "vote_count": 1486
        },
        {
            "adult": false,
            "backdrop_path": "/mv8M0PqQYicndU7TGgBAHrI4uUo.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 744857,
            "original_language": "es",
            "original_title": "Cuando acecha la maldad",
            "overview": "Residents of a small rural town discover that a demon is about to be born among them. They desperately try to escape before the evil is born, but it may be too late.",
            "popularity": 648.637,
            "poster_path": "/iQ7G9LhP7NRRIUM4Vlai3eOxBAc.jpg",
            "release_date": "2023-10-05",
            "title": "When Evil Lurks",
            "video": false,
            "vote_average": 7.6,
            "vote_count": 139
        },
        {
            "adult": false,
            "backdrop_path": "/tj7mp7uWjVw5N73G5Hwm1bkMOcD.jpg",
            "genre_ids": [
                28,
                10752
            ],
            "id": 975902,
            "original_language": "en",
            "original_title": "Boudica",
            "overview": "Inspired by events in A.D. 60, Boudica follows the eponymous Celtic warrior who rules the Iceni people alongside her husband Prasutagus. When he dies at the hands of Roman soldiers, Boudica’s kingdom is left without a male heir and the Romans seize her land and property.  Driven to the edge of madness and determined to avenge her husband’s death, Boudica rallies the various tribes from the region and wages an epic war against the mighty Roman empire.",
            "popularity": 857.214,
            "poster_path": "/ssEFC5wfFjj7lJpUgwJDOK1Xu1J.jpg",
            "release_date": "2023-10-26",
            "title": "Boudica",
            "video": false,
            "vote_average": 6.625,
            "vote_count": 12
        },
        {
            "adult": false,
            "backdrop_path": "/iIvQnZyzgx9TkbrOgcXx0p7aLiq.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 1008042,
            "original_language": "en",
            "original_title": "Talk to Me",
            "overview": "When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.",
            "popularity": 692.817,
            "poster_path": "/kdPMUMJzyYAc4roD52qavX0nLIC.jpg",
            "release_date": "2023-07-26",
            "title": "Talk to Me",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 1669
        },
        {
            "adult": false,
            "backdrop_path": "/jP3FatCTHc460ZGW57q9ypTdBqu.jpg",
            "genre_ids": [
                53,
                878,
                28
            ],
            "id": 937249,
            "original_language": "en",
            "original_title": "57 Seconds",
            "overview": "When a tech blogger lands an interview with a tech guru and stops an attack on him, he finds a mysterious ring that takes him back 57 seconds into the past.",
            "popularity": 493.184,
            "poster_path": "/dfS5qHWFuXyZQnwYREwb7N4qU5p.jpg",
            "release_date": "2023-09-29",
            "title": "57 Seconds",
            "video": false,
            "vote_average": 5.615,
            "vote_count": 161
        },
        {
            "adult": false,
            "backdrop_path": "/45zVtZx6Tzx3RKeDziK25K9geFf.jpg",
            "genre_ids": [
                16,
                10751,
                10402,
                14,
                35
            ],
            "id": 901362,
            "original_language": "en",
            "original_title": "Trolls Band Together",
            "overview": "When Branch’s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains, Branch and Poppy embark on a harrowing and emotional journey to reunite the other brothers and rescue Floyd from a fate even worse than pop-culture obscurity.",
            "popularity": 407.546,
            "poster_path": "/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
            "release_date": "2023-10-12",
            "title": "Trolls Band Together",
            "video": false,
            "vote_average": 6.3,
            "vote_count": 26
        },
        {
            "adult": false,
            "backdrop_path": "/aOI3o06xhCgLmA6Bcpm4KRDeMXF.jpg",
            "genre_ids": [
                35,
                18
            ],
            "id": 763165,
            "original_language": "en",
            "original_title": "The Burial",
            "overview": "When a handshake deal goes sour, funeral home owner Jeremiah O'Keefe enlists charismatic, smooth-talking attorney Willie E. Gary to save his family business. Tempers flare and laughter ensues as the unlikely pair bond while exposing corporate corruption and racial injustice.",
            "popularity": 359.624,
            "poster_path": "/9ssNSfNKpzZwhbFsnW3wa82m2sG.jpg",
            "release_date": "2023-10-06",
            "title": "The Burial",
            "video": false,
            "vote_average": 7.322,
            "vote_count": 211
        }
    ],
    "total_pages": 104,
    "total_results": 2061
}
""".data(using: .utf8)

let nowPlayingMovieResponse = try? JSONDecoder().decode(MovieAppModel.self, from: nowPlayingMovieData!)


