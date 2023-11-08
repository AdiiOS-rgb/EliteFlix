//
//  UpcomingMovies.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let upComingMovieData = """
{
    "dates": {
        "maximum": "2023-11-29",
        "minimum": "2023-11-08"
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
            "vote_average": 8.266,
            "vote_count": 1568
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
            "vote_average": 8.14,
            "vote_count": 1178
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
            "backdrop_path": "/feSiISwgEpVzR1v3zv2n2AU4ANJ.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 609681,
            "original_language": "en",
            "original_title": "The Marvels",
            "overview": "Carol Danvers, aka Captain Marvel, has reclaimed her identity from the tyrannical Kree and taken revenge on the Supreme Intelligence. But unintended consequences see Carol shouldering the burden of a destabilized universe. When her duties send her to an anomalous wormhole linked to a Kree revolutionary, her powers become entangled with that of Jersey City super-fan Kamala Khan, aka Ms. Marvel, and Carol’s estranged niece, now S.A.B.E.R. astronaut Captain Monica Rambeau. Together, this unlikely trio must team up and learn to work in concert to save the universe.",
            "popularity": 257.235,
            "poster_path": "/Ag3D9qXjhJ2FUkrlJ0Cv1pgxqYQ.jpg",
            "release_date": "2023-11-08",
            "title": "The Marvels",
            "video": false,
            "vote_average": 8.1,
            "vote_count": 12
        },
        {
            "adult": false,
            "backdrop_path": "/xHqTnPtpd9Qd7R0fVtoqxZYM67Q.jpg",
            "genre_ids": [
                80,
                53,
                28
            ],
            "id": 958006,
            "original_language": "en",
            "original_title": "The Kill Room",
            "overview": "A hitman, his boss, an art dealer and a money-laundering scheme that accidentally turns the assassin into an overnight avant-garde sensation, one that forces her to play the art world against the underworld.",
            "popularity": 298.417,
            "poster_path": "/qKpdy7N6zX05eisopvvviiTwPxb.jpg",
            "release_date": "2023-09-14",
            "title": "The Kill Room",
            "video": false,
            "vote_average": 6.2,
            "vote_count": 34
        },
        {
            "adult": false,
            "backdrop_path": "/mfm4srsPALxaeOMFFFJ0drXTyXy.jpg",
            "genre_ids": [
                35,
                12
            ],
            "id": 912908,
            "original_language": "en",
            "original_title": "Strays",
            "overview": "When Reggie is abandoned on the mean city streets by his lowlife owner, Doug, Reggie is certain that his beloved owner would never leave him on purpose. But once Reggie falls in with Bug, a fast-talking, foul-mouthed stray who loves his freedom and believes that owners are for suckers, Reggie finally realizes he was in a toxic relationship and begins to see Doug for the heartless sleazeball that he is.",
            "popularity": 256.373,
            "poster_path": "/muDaKftykz9Nj1mhRheMdbuNI9Z.jpg",
            "release_date": "2023-08-17",
            "title": "Strays",
            "video": false,
            "vote_average": 7.538,
            "vote_count": 482
        },
        {
            "adult": false,
            "backdrop_path": "/cRdA9xjHBbobw4LJFsQ3j1CgpVq.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 663712,
            "original_language": "en",
            "original_title": "Terrifier 2",
            "overview": "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
            "popularity": 190.979,
            "poster_path": "/8gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg",
            "release_date": "2022-10-06",
            "title": "Terrifier 2",
            "video": false,
            "vote_average": 6.791,
            "vote_count": 1466
        },
        {
            "adult": false,
            "backdrop_path": "/cofs7Y72FkRjALbOOOz8q7Uty6h.jpg",
            "genre_ids": [
                18,
                53
            ],
            "id": 944952,
            "original_language": "en",
            "original_title": "The Royal Hotel",
            "overview": "After running out of money while backpacking in a tiny, male-dominated town in the Australian outback, two friends resort to a working holiday at the Royal Hotel. When the locals behavior starts crossing the line, the girls find themselves trapped in an unnerving situation that grows rapidly out of their control.",
            "popularity": 122.781,
            "poster_path": "/oJwb2PV1LGxDp6Q3lynrjADxOIv.jpg",
            "release_date": "2023-10-06",
            "title": "The Royal Hotel",
            "video": false,
            "vote_average": 5.843,
            "vote_count": 35
        },
        {
            "adult": false,
            "backdrop_path": "/a0GM57AnJtNi7lMOCamniiyV10W.jpg",
            "genre_ids": [
                16,
                12,
                14,
                18
            ],
            "id": 508883,
            "original_language": "ja",
            "original_title": "君たちはどう生きるか",
            "overview": "While the Second World War rages, the teenage Mahito, haunted by his mother's tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy's mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the \"long-awaited one.\"",
            "popularity": 102.439,
            "poster_path": "/y9xS5NQTBnFjDoXhSFQeGxlmkoM.jpg",
            "release_date": "2023-07-14",
            "title": "The Boy and the Heron",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 95
        },
        {
            "adult": false,
            "backdrop_path": "/qZOuoBoKCDLSm1EvYz2eBub8Cto.jpg",
            "genre_ids": [
                16,
                12,
                14,
                10751
            ],
            "id": 939338,
            "original_language": "fr",
            "original_title": "Pattie et la colère de Poséidon",
            "overview": "An adventurous mouse sets off to battle dangerous creatures in Ancient Greece, including Poseidon.",
            "popularity": 131.995,
            "poster_path": "/gVPw9gRPsZZhzY6cIXp6h6nep5M.jpg",
            "release_date": "2023-01-25",
            "title": "Epic Tails",
            "video": false,
            "vote_average": 6.935,
            "vote_count": 46
        },
        {
            "adult": false,
            "backdrop_path": "/mEcCz4Nzw57wJIXo6g69q9NUQih.jpg",
            "genre_ids": [
                16,
                10751,
                14,
                12
            ],
            "id": 1022796,
            "original_language": "en",
            "original_title": "Wish",
            "overview": "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force—a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe—the ruler of Rosas, King Magnifico—to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.",
            "popularity": 105.25,
            "poster_path": "/8QtDhh8mnGUEyrJsaeb3kYgDRaA.jpg",
            "release_date": "2023-11-22",
            "title": "Wish",
            "video": false,
            "vote_average": 0.0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/hon92J1oqdrTwcGHXG64G2bXqrJ.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 695721,
            "original_language": "en",
            "original_title": "The Hunger Games: The Ballad of Songbirds & Snakes",
            "overview": "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.",
            "popularity": 108.172,
            "poster_path": "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
            "release_date": "2023-11-15",
            "title": "The Hunger Games: The Ballad of Songbirds & Snakes",
            "video": false,
            "vote_average": 0.0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/wOYDsD7WIKsz5DtrnjsvCcEyFJa.jpg",
            "genre_ids": [
                36,
                18,
                10752
            ],
            "id": 753342,
            "original_language": "en",
            "original_title": "Napoleon",
            "overview": "A personal look at the French military leader’s origins and swift, ruthless climb to emperor, viewed through the prism of Napoleon’s addictive, volatile relationship with his wife and one true love, Josephine.",
            "popularity": 108.512,
            "poster_path": "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
            "release_date": "2023-11-22",
            "title": "Napoleon",
            "video": false,
            "vote_average": 0.0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/8g9ZdvHX6jszRY71aVtpRUmHQzJ.jpg",
            "genre_ids": [
                18,
                53
            ],
            "id": 958182,
            "original_language": "es",
            "original_title": "Heroico",
            "overview": "Luis, an 18-year-old boy with Indigenous roots, enters the Heroic Military College in hopes of ensuring a better future. There, he encounters a rigid and institutionally violent system designed to turn him into a perfect soldier.",
            "popularity": 98.699,
            "poster_path": "/w0iYqKZYoVmyoX0Av4FdsDiDXWo.jpg",
            "release_date": "2023-09-21",
            "title": "Heroic",
            "video": false,
            "vote_average": 6.3,
            "vote_count": 10
        },
        {
            "adult": false,
            "backdrop_path": "/rron9HAuS9s7zBF8iCX1tsafxUo.jpg",
            "genre_ids": [
                18,
                10749
            ],
            "id": 666277,
            "original_language": "en",
            "original_title": "Past Lives",
            "overview": "Nora and Hae Sung, two childhood friends, are reunited in New York for one fateful week as they confront notions of destiny, love, and the choices that make a life.",
            "popularity": 86.623,
            "poster_path": "/k3waqVXSnvCZWfJYNtdamTgTtTA.jpg",
            "release_date": "2023-06-02",
            "title": "Past Lives",
            "video": false,
            "vote_average": 7.869,
            "vote_count": 259
        },
        {
            "adult": false,
            "backdrop_path": "/5ut2rC5H1YE0GnNPpl1csnNvqum.jpg",
            "genre_ids": [
                28,
                18,
                80
            ],
            "id": 1093485,
            "original_language": "cn",
            "original_title": "掃毒3︰人在天涯",
            "overview": "Hong Kong police agent Cheung (by Aaron Kwok) works undercover in Kang’s (by Sean Lau) drug cartel, while another undercover cop Au (by Louis Koo) successfully earns their trust in an incident, a brotherly-bond is built among the three. After the Police busts the syndicate in Hong Kong, Kang subsequently hides away in the Golden Triangle, by chance he receives a tip-off about the betrayal within his circle of trust…",
            "popularity": 98.916,
            "poster_path": "/kPjZsEni0KF0IXGXh0kaxNESdGE.jpg",
            "release_date": "2023-07-06",
            "title": "The White Storm 3: Heaven or Hell",
            "video": false,
            "vote_average": 6.512,
            "vote_count": 41
        },
        {
            "adult": false,
            "backdrop_path": "/eXX9PqCgbTVYnnlbGuAz7Lk4E86.jpg",
            "genre_ids": [
                27,
                12
            ],
            "id": 1145851,
            "original_language": "es",
            "original_title": "El hombre del saco",
            "overview": "Explores the Spanish origins of the character's story, where he is a tuberculosis patient from Almeria who will do anything to get well, even consuming the blood of the kids he kidnaps in a sack.",
            "popularity": 104.346,
            "poster_path": "/3EdqlGB2ACpnqsrtKhyacaPhzHK.jpg",
            "release_date": "2023-08-11",
            "title": "El hombre del saco",
            "video": false,
            "vote_average": 5.794,
            "vote_count": 34
        },
        {
            "adult": false,
            "backdrop_path": "/drfl2eWipiibW3u3Ybx9HQ8VgIn.jpg",
            "genre_ids": [
                27,
                9648,
                53
            ],
            "id": 841742,
            "original_language": "fr",
            "original_title": "Megalomaniac",
            "overview": "Felix and Martha, the two offspring of legendary serial murderer The Skinner of Mons, grapple with the grotesque legacy bequeathed to them. While Martha works a menial janitorial job, Felix continues his father's reign of terror. But following a brutal attack at work, Martha quickly descends into madness, finding she must come to terms with the infamous blood that flows through her veins.",
            "popularity": 86.176,
            "poster_path": "/bgullymFFblfNaEqRX2j74oTIQ.jpg",
            "release_date": "2023-09-08",
            "title": "Megalomaniac",
            "video": false,
            "vote_average": 6.192,
            "vote_count": 13
        },
        {
            "adult": false,
            "backdrop_path": "/3xYPGRUsXCZj7rKOzvOY84JCafK.jpg",
            "genre_ids": [
                18,
                10749
            ],
            "id": 1020006,
            "original_language": "en",
            "original_title": "Priscilla",
            "overview": "When teenage Priscilla Beaulieu meets Elvis Presley at a party, the man who is already a meteoric rock-and-roll superstar becomes someone entirely unexpected in private moments: a thrilling crush, an ally in loneliness, a vulnerable best friend.",
            "popularity": 59.151,
            "poster_path": "/3eTAdKJzC8biM52Eii1ghk69bMP.jpg",
            "release_date": "2023-10-26",
            "title": "Priscilla",
            "video": false,
            "vote_average": 7.0,
            "vote_count": 12
        }
    ],
    "total_pages": 29,
    "total_results": 578
}
""".data(using: .utf8)

let upComingMovieResponse = try? JSONDecoder().decode(MovieAppModel.self, from: upComingMovieData!)


