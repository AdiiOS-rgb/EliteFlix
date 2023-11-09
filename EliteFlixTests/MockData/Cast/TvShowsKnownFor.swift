//
//  TvShowsKnownFor.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

let tvShowsKnownForData = """
{
    "cast": [
        {
            "adult": true,
            "backdrop_path": "/a3n4uMP2ulmvyxrlpvigCmNx8SG.jpg",
            "genre_ids": [
                16
            ],
            "id": 73129,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "えろげー! ~Hもゲームも開発三昧~",
            "overview": "Mochizuki Tomoya is a guy that lives on his own with only a day job at a convenience store keeping him afloat. While he really likes eroge, he can't draw, isn't much of a writer or composer, and doesn't know much about business. Still, his dream is to get a job at an eroge studio in hopes of creating what he loves, eroge.nnTomoya's luck takes a turn for the better when he sees a help wanted ad for the local studio Flower, and after a meeting with the company president (who to his surprise looks like an elementary school kid), manages to get a job as administrator of the company's website. Tomoya's glee at being part of the eroge industry is short-lived, as he soon learns that Flower is on the chopping block due to their first title being a massive failure.nnAfter playing through Flower's first title, Tomoya realizes that his co-workers don't know anything about eroge, lacking the insight and understanding needed to make a good game...",
            "popularity": 0.0,
            "poster_path": "/nkx98Vyr2VhZ7VxJYhgClH8CS9q.jpg",
            "first_air_date": "2011-08-26",
            "name": "Eroge! H mo Game mo Kaihatsu Zanmai",
            "vote_average": 9.8,
            "vote_count": 13,
            "character": "Momoka Fujiwara (voice)",
            "credit_id": "5a2c42f30e0a264cc413733e",
            "episode_count": 6
        },
        {
            "adult": true,
            "backdrop_path": "/52YBjMQcLfAZHQJjqnrXLBBY68X.jpg",
            "genre_ids": [
                16
            ],
            "id": 71309,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "あねよめカルテット",
            "overview": "The Hanabishi family and Hidaka family are next door neighbors. The fathers of both households could be called best friends, so they all get along like one big happy family. In particular, Hidaka family’s only son Kouki was raised lovingly by the four Hanabishi sisters like he was their own brother.nnOne day, the Hanabishi and Hidaka parents were preparing for a long term overseas business trip together. Kouki ended up living together with the four sisters. And one of them is promised to him as a fiance. But who should he choose?",
            "popularity": 0.0,
            "poster_path": "/txyrzORWvGkvzCNoigDcnOY2CH8.jpg",
            "first_air_date": "2015-10-09",
            "name": "Ane Yome Quartet",
            "vote_average": 9.7,
            "vote_count": 3,
            "character": "Yurina Hanabishi (voice as Mei Misonoo)",
            "credit_id": "5ba80fc99251412ef40316c6",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/jn1U7W05UR4P4fmfHvv2te3HGi8.jpg",
            "genre_ids": [
                16
            ],
            "id": 69185,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "ばくあね 弟しぼっちゃうぞ! THE ANIMATION",
            "overview": "Having suffered an injury during a soccer game, Ryoushirou Hayasaki returns to his parents' house to undergo therapy. As both of them are currently abroad, the only ones to welcome him home are his four older sisters—Yurine, Noemi, Naru, and Mio.nnHis laid-back recovery is soon interrupted when Noemi finds her brother's erotic comics and love letters from younger classmates. The sisters soon realize that Ryoushirou has a little sister complex and the family argument that follows leaves the siblings at odds. Depressed and fed-up, Ryoushirou considers leaving the house. However, he gets an unexpected visit by Yurine that night—a short-haired and well-endowed beauty who is willing to help him with his rehabilitation and make up for the other sisters' outburst. Unable to deny himself the guilty pleasure, Ryoushirou decides to make the most of his stay and take advantage of the wonders around him.",
            "popularity": 0.0,
            "poster_path": "/pezkeUPSu08wkwasRT63EiTrIGg.jpg",
            "first_air_date": "2014-08-29",
            "name": "Baku Ane: Otouto Shibocchau zo! The Animation",
            "vote_average": 9.4,
            "vote_count": 9,
            "character": "Hayasaki Naru / Misono Miho (voice)",
            "credit_id": "5bef0734c3a36818b001996e",
            "episode_count": 3
        },
        {
            "adult": true,
            "backdrop_path": "/a3ig6kgkKfLbb9mj96DgPdkKzOz.jpg",
            "genre_ids": [
                16,
                10765
            ],
            "id": 77465,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "ようこそ! スケベエルフの森へ",
            "overview": "Alfheim, a world of elves where women only exist. The world Shrine, the source of all the elves' magical power, has started to fade and the race was in danger of extinction. Then there is a prophecy that a man from another world is destined to be the savior of the elven race. And it was not too long the hero is now brought to the world of Elves...",
            "popularity": 0.0,
            "poster_path": "/2rHv7VhFNZFKI8vaipBeWBcDCfD.jpg",
            "first_air_date": "2018-02-15",
            "name": "Welcome! To the Forest of Lewd Elves",
            "vote_average": 9.2,
            "vote_count": 18,
            "character": "Ruushe Menerumia",
            "credit_id": "5cfcd1af0e0a267113cd0703",
            "episode_count": 4
        },
        {
            "adult": true,
            "backdrop_path": "/l4vUArcHOdcb6wGrAIEqlIfzTZ4.jpg",
            "genre_ids": [
                16
            ],
            "id": 93171,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "奥様は元ヤリマン",
            "overview": "Yuuto is living alone in an apartment complex but thanks to his neighbours Megumi, Anna and Mako he's not feeling lonely. Though he enjoys their company (and their looks) he is a bit disappointed that they always treat him as a child, not as a mannnThings change on the night of his birthday when, after the party the three throw for him, Megumi tells him that as a birthday present she'll do something for him. It's the beginning of Yuuto's hot summer vacation with the three busty women...",
            "popularity": 0.0,
            "poster_path": "/iyWnfKVKK8bJQ33HJrypzRPwxY.jpg",
            "first_air_date": "2014-02-28",
            "name": "Okusama wa Moto Yariman",
            "vote_average": 6.0,
            "vote_count": 1,
            "character": "Mako Suzumoto",
            "credit_id": "5d6cda3cefcea900139b41de",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/hFXxIg8b1aTWpNZg5wRN8LK0B3R.jpg",
            "genre_ids": [
                16
            ],
            "id": 93188,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "聖ヤリマン学園援交日記",
            "overview": "Saiki Yasuo is a 45-year-old office worker. After 20 years of marriage, his wife asked for a divorce and left him. Now, depressed, he spends the nights drinking alone, until one night a girl from the St. Marian Academy approaches him looking for a client",
            "popularity": 0.0,
            "poster_path": "/khWG57AiwYY5g2BpmB51eI0djFx.jpg",
            "first_air_date": "2013-02-22",
            "name": "Saint Slut Academy",
            "vote_average": 10.0,
            "vote_count": 2,
            "character": "Miho Misono",
            "credit_id": "5d6e1a77a284eb473333e843",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/hFXxIg8b1aTWpNZg5wRN8LK0B3R.jpg",
            "genre_ids": [
                16
            ],
            "id": 93188,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "聖ヤリマン学園援交日記",
            "overview": "Saiki Yasuo is a 45-year-old office worker. After 20 years of marriage, his wife asked for a divorce and left him. Now, depressed, he spends the nights drinking alone, until one night a girl from the St. Marian Academy approaches him looking for a client",
            "popularity": 0.0,
            "poster_path": "/khWG57AiwYY5g2BpmB51eI0djFx.jpg",
            "first_air_date": "2013-02-22",
            "name": "Saint Slut Academy",
            "vote_average": 10.0,
            "vote_count": 2,
            "character": "Maki Nagase",
            "credit_id": "5d6e1c7fa284eb473333e9a3",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/2eAOUcXzqvZ6qZHwPa8B0tQ3PTR.jpg",
            "genre_ids": [
                16
            ],
            "id": 81971,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "黒獣 (クロイヌ) ~気高き聖女は白濁に染まる~",
            "overview": "In the land of Eostia, humans and dark elves have fought for supremacy for over a century. The dark elves rule over a race of monsters that has raided human lands for generations, capturing and defiling their women. Aided by powerful bands of mercenaries, the human kingdoms have gradually pushed back their old rivals.",
            "popularity": 0.0,
            "poster_path": "/vjHOrQhzTDjuosSxpVFo4XveGVs.jpg",
            "first_air_date": "2012-01-27",
            "name": "Kuroinu: Kedakaki Seijo wa Hakudaku ni Somaru",
            "vote_average": 8.9,
            "vote_count": 19,
            "character": "Claudia Levantain",
            "credit_id": "5e67b49a459ad600135dca2d",
            "episode_count": 6
        },
        {
            "adult": true,
            "backdrop_path": "/ieVIyzd5DuqqyvzUX4DsBTxtNvr.jpg",
            "genre_ids": [
                16,
                18
            ],
            "id": 94265,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "なまイキ ~生粋荘へようこそ!~ THE ANIMATION",
            "overview": "Ashifuji Satoshi is hired as the caretaker of Kissuisou dormitory, which is home to three female occupants: cheerful coach Esumi Mei, surly guard Ogata Saki, and perverted mangaka Umi Rurika. However, almost immediately after landing the job, Satoshi is contacted by Ibaraki, the house spirit of Kissuisou. Ibaraki's power is drawn from seeing people copulate. Thus in order to restore her strength, the spirit orders Satoshi to offer his sperm to each woman in the house and Satoshi begins this peculiar task with her assistance.",
            "popularity": 0.0,
            "poster_path": "/o0hqOMT0ynLza1ir5DsvjhwAEsR.jpg",
            "first_air_date": "2015-04-24",
            "name": "Namaiki: Kissuisou e Youkoso! The Animation",
            "vote_average": 8.5,
            "vote_count": 4,
            "character": "Esumi Mei",
            "credit_id": "5fa099cee63571003a586cbd",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/194xsRDRvwP6ix7JMRFb0585KA.jpg",
            "genre_ids": [
                16
            ],
            "id": 83614,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "新妻こよみ THE ANIMATION",
            "overview": "Our protagonist is an in training ceramist out in the countryside who just so happens to have 4 different girls all fighting for his love! A simple country girl, his big sister, a fox deity and the daughter of his mentor! How could he ever choose just one?! They decide to fight for his love by having a newlywed day for each of them to see who he prefers...",
            "popularity": 0.0,
            "poster_path": "/ikDzwtBo2VSoheaZd2uvuUEx6lq.jpg",
            "first_air_date": "2018-07-27",
            "name": "Niizuma Koyomi The Animation",
            "vote_average": 8.8,
            "vote_count": 4,
            "character": "Uikawa Shino",
            "credit_id": "5fc56d658a84d2004014862c",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/tpCLu7jFVj1n80gXGhpkv26uN6f.jpg",
            "genre_ids": [
                16
            ],
            "id": 86076,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "山姫の花 真穂",
            "overview": "Naoki has left town for an unknown amount of time, leaving his precious girlfriend Maho, who promises to wait for him.  Shortly after reuniting with Maho, Naoki learns that she is cheating on him...",
            "popularity": 0.0,
            "poster_path": "/5i0tgDplKLgPaU0ZLwemjuzDNKb.jpg",
            "first_air_date": "2011-04-15",
            "name": "Akebi no Hana: Maho",
            "vote_average": 6.0,
            "vote_count": 1,
            "character": "Nakajima Saki (voice)",
            "credit_id": "603105fca6e2d2003f0733c7",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/uNhIqXrODQhYB0BUXxU0uW9RZLv.jpg",
            "genre_ids": [
                16
            ],
            "id": 72759,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "バカだけどチンチンしゃぶるのだけはじょうずなちーちゃん♡",
            "overview": "Hey, Kou-chin. Sorry to bug you but, will you help me study nnIt was a Saturday. There was still a month of summer vacation to go. Due to complicated family circumstances, Kouta - Kou-chin - who lives alone meet Chieri - Chi-chan - a classmate of Kouta's at the conbini near his house.nnThis ditzy kurogal was his benefactor for the summer. Kouta helped her study - though he could hardly focus - and as a bonus he was endlessly visually entertained. He knew Chi-chan had a boyfriend so...... well, he didn't torture himself with fantasies, but at the same time Chi-chan had a flirty, cockteasing way.",
            "popularity": 0.0,
            "poster_path": "/bWnkVXhr3GZYxAZbQwP2Kgxhkbu.jpg",
            "first_air_date": "2017-06-30",
            "name": "Baka Dakedo Chinchin Shaburu no Dake wa Jouzu na Chii-chan",
            "vote_average": 8.0,
            "vote_count": 7,
            "character": "Shiina Chieri (voice) credited as Misonoo Mei",
            "credit_id": "603d4819a9b9a4005a4655b0",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/rqsrv4NnMeRNujWfE4EMjHyZi1p.jpg",
            "genre_ids": [
                16
            ],
            "id": 77560,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "自宅警備員",
            "overview": "He is a private home security officer with 20 years of military experience. Exceptionally trained in technology and intelligence gathering, he perceives and records the smallest of details of the home to which he is dispatched.nnHis new assignment is directly from his father, Takao Kareki. He must look after his father's new lover, a potential bride. Nothing but the best professional will do to keep her safe. But in her home, he sees all.",
            "popularity": 0.0,
            "poster_path": "/Afg9cR0c7hUdAbcPArG64KZ5j0i.jpg",
            "first_air_date": "2017-03-31",
            "name": "Jitaku Keibiin",
            "vote_average": 8.4,
            "vote_count": 5,
            "character": "Katsuragi Shouko (voice)",
            "credit_id": "606461357dfda6006ba024eb",
            "episode_count": 4
        },
        {
            "adult": true,
            "backdrop_path": null,
            "genre_ids": [
                16
            ],
            "id": 107320,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "自宅警備員 ターゲット",
            "overview": "NEET basement dweller, Kareki Tsunetaka champions himself as the home guardian as he attempts to oust his stepsisters and -mother from the house by hiding a bunch of surveillance cameras into the house and using the recorded footage to blackmail the victims into having intimate relations with him.",
            "popularity": 0.0,
            "poster_path": "/1tL46A58Ll48qvohq4q8WbegGQ5.jpg",
            "first_air_date": "2019-05-31",
            "name": "Jitaku Keibiin 3",
            "vote_average": 4.0,
            "vote_count": 1,
            "character": "Katsuragi Shouko (voice)",
            "credit_id": "60668569fd7aa40040bcc74b",
            "episode_count": 4
        },
        {
            "adult": true,
            "backdrop_path": "/xTxDEkd98XZiQFEFQwNc1YeAkUs.jpg",
            "genre_ids": [
                16
            ],
            "id": 113208,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "母ちゃんの友達にシコってるところ見られた. THE ANIMATION",
            "overview": "Naoki is a young man who enjoys cooking and watches a lot of porn. One day when the best friend of his mother, Shiori, is staying over she accidentally walks in on him masturbating. As fortune would have it, Shiori is aroused by the act and gives into Naoki's advances. Shiori is quickly impressed by Naoki's sexual knowledge gained from porn and virile stamina.",
            "popularity": 0.0,
            "poster_path": "/chGnBlxpCJyvsNqJZXmcdde5Ogs.jpg",
            "first_air_date": "2020-10-30",
            "name": "Mom's Friend Caught Me Stroking Myself. The Animation",
            "vote_average": 10.0,
            "vote_count": 2,
            "character": "Nishimura Shiori (voice)",
            "credit_id": "606c569f44ea540059354a4d",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/oUhrQ0SUHCSjW7cj8YpuG7pNm1a.jpg",
            "genre_ids": [
                16
            ],
            "id": 109325,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "色欲INFINITE",
            "overview": "This family is absolutely filled to the brim with sluts. There isn't really a better way to put it! While the man of the house goes on long business trips, his wife and daughters have over as many men as they can possibly handle!",
            "popularity": 0.0,
            "poster_path": "/ySRsq2eRWo3SKLFwBXb9i0LcAAe.jpg",
            "first_air_date": "2020-08-28",
            "name": "Shikiyoku INFINITE",
            "vote_average": 8.5,
            "vote_count": 2,
            "character": "Souma Souko (voice)",
            "credit_id": "606e6dc09979d2006e1758cb",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/eFz5HmhEj4kk2qbY6IH6Br0NGx1.jpg",
            "genre_ids": [
                16
            ],
            "id": 94122,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "ヘルタースケルター ~白濁の村~",
            "overview": "Miu and her family of four women are well-known in the media for being aspiring young celebrities. Her mother, Sayoko, is a famous fashion designer and has scored a job for the family to shoot a TV production, a rare opportunity for the family to be together and enjoy themselves. The girls travel to a small, isolated village in late August and the filming begins. Little do Miu and her family know however, the entire production is a scheme. This is the time for a local festival and they happened to unwillingly volunteer to be a key figure for this festival; the Shishigami. One by one, the girls are subjected to the traditions of the festival, experiencing first-hand just how serious it is.",
            "popularity": 0.0,
            "poster_path": "/xuMH1ACdGXsIj0dXl7zYLMRZsts.jpg",
            "first_air_date": "2009-01-30",
            "name": "Helter Skelter: Hakudaku no Mura",
            "vote_average": 0.0,
            "vote_count": 0,
            "character": "Kagami Fubuki (voice)",
            "credit_id": "60748ea52faf4d0078a65649",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/gDYDEHshirvqQqEV74RIDoaqEtJ.jpg",
            "genre_ids": [
                16
            ],
            "id": 80797,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "乳色吐息",
            "overview": "Takashi's childhood friend Saya and his little sister Mika may not see him as a real man, but just being around them has been provoking him more and more. Following yet another failed proposal on his part, Saya feels bad for him and lets him grope her breasts, but it quickly gets out of hand and turns into a full night of full-blown sex!nn(These OVA's are based on the erotic manga by Goban.)",
            "popularity": 0.0,
            "poster_path": "/fkLa8ITKgJG4JKCfDoaUPUZJo1R.jpg",
            "first_air_date": "2014-05-30",
            "name": "Chichi-iro Toiki",
            "vote_average": 9.4,
            "vote_count": 7,
            "character": "Kawasumi Saya (voice)",
            "credit_id": "607eb813aa659e0078e0a77d",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/43MVQ2kJd4b1xKgRPTe0gmPHPzB.jpg",
            "genre_ids": [
                16
            ],
            "id": 97925,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "コスプレ楽園",
            "overview": "A generic story of girls in uniforms getting intimate with a teacher at school. Uniforms includes teacher, swimsuit, schoolgirl and nurse.",
            "popularity": 0.0,
            "poster_path": "/hJSsKQ4vZUCEMLdOyoBlzK2WUpx.jpg",
            "first_air_date": "2014-01-01",
            "name": "Cosplay Heaven",
            "vote_average": 0.0,
            "vote_count": 0,
            "character": "Mafuyu (voice)",
            "credit_id": "607eff7af6787a007861a607",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/2vOTI6DcGoJQ7yodiMqp2ognPJt.jpg",
            "genre_ids": [
                16
            ],
            "id": 80799,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "くりぃみぃパイ",
            "overview": "A series of short stories, based on the erotic manga by Emily, involving high school students and their love lives.",
            "popularity": 0.0,
            "poster_path": "/vrCHIeumoym4C3M4RyieOdUrCpw.jpg",
            "first_air_date": "2015-10-16",
            "name": "Creamy Pie",
            "vote_average": 0.0,
            "vote_count": 0,
            "character": "Alice (voice)",
            "credit_id": "608001f7a1d3320057758a59",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/oiyPYFKjWCSguUcAqSpxWSRfOGK.jpg",
            "genre_ids": [
                16
            ],
            "id": 77719,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "恥辱の制服",
            "overview": "Is your neighbor rude to you? Fuck his wife. That's the moral of this story. Well, it would be if it stopped there. But our protagonist also decides to place spy cameras in another chick's apartment to blackmail and fuck her for no reason. Well, for no reason besides getting his dick wet that is. He even blackmails and enjoys a nurse, building up his harem, one slut at a time.nn(These OVAs are based on the erotic game by Bishop.)",
            "popularity": 0.0,
            "poster_path": "/oKJBKnLuxbaV0SJR3yJU1oKW1rH.jpg",
            "first_air_date": "2016-05-20",
            "name": "Chijoku no Seifuku",
            "vote_average": 8.5,
            "vote_count": 2,
            "character": "Tokuzawa Akemi (voice)",
            "credit_id": "608047c5c439c0002a39ebcc",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/tcAgjKAe792W6b62gQ1KBybgh0L.jpg",
            "genre_ids": [
                16,
                10765
            ],
            "id": 125296,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "陰陽師 妖かしの女神～淫乱呪縛～",
            "overview": "An evil goddess is trying to gain absolute power via absorbing the life energy of a human using a woman as a succubus. Four minor goddesses try to stop her, the goddess of Tiger, Dragon, Phoenix and Turtle, but their efforts seem useless as two of them fall under control of the evil goddess. The life of the young human is being absorbed so they must hurry to save him.",
            "popularity": 0.0,
            "poster_path": "/2cuhnJk3xSyzi9330YbWO9cXaZ0.jpg",
            "first_air_date": "2009-11-25",
            "name": "Onmyouji Ayakashi no Megami: Inran Jubaku",
            "vote_average": 0.0,
            "vote_count": 0,
            "character": "Genbu",
            "credit_id": "60aa5dbf976a23007954171a",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/hTETbUJBM5Tf0wC3W8QdrVcWUIw.jpg",
            "genre_ids": [
                16
            ],
            "id": 93175,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "ヌーディストビーチに修学旅行で!! THE ANIMATION",
            "overview": "Suomi-sensei surprises – or rather shocks – her class with the announcement that the destination of this year’s class trip will be a nude beach. And before the first thoughts purposely missing the event come up, she cheerfully announces that non-participation will result in expulsion from school. She hopes for this excursion that the friendships among her students will deepen and that they will grow together as a community. At the beginning, nobody knows where to keep their eyes and everybody is more embarrassed than anything else, but the class president, of all people, who is considered very level-headed, is the first one who can’t hold on any longer. Suomi-sensei has also taken precautions for this and set up a “cooling tent”. However, the students are only allowed to enter it in pairs…",
            "popularity": 0.0,
            "poster_path": "/3DWkL7WQoyYkCyjC4wZI7ElHhE6.jpg",
            "first_air_date": "2016-05-27",
            "name": "Nudist Beach ni Shuugaku Ryokou de!! The Animation",
            "vote_average": 8.2,
            "vote_count": 4,
            "character": "Maria Sakai (voice)",
            "credit_id": "61446ba10486380061848555",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/c3E6xy9FvPgX8nLjyFXuR7XZSkT.jpg",
            "genre_ids": [],
            "id": 97928,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "かがち様お慰め奉ります ～寝取られ村淫夜噺～",
            "overview": "Takahiko goes back to his hometown together with his wife Manami. There he reunites with Ayaka - his first love who has since married his father. Despite the fact she is now his stepmother, Takahiko tries to make Ayaka his. But his father has other plans - for all of them...",
            "popularity": 0.0,
            "poster_path": "/qtFu3mibj5rZljbZnrp5baVimyw.jpg",
            "first_air_date": "2013-10-25",
            "name": "Kagachi-sama Onagusame Tatematsurimasu: Netorare Mura Inya Hanashi The Animation",
            "vote_average": 6.5,
            "vote_count": 2,
            "character": "Tomikura Manami",
            "credit_id": "6146036c5e1200008dab298e",
            "episode_count": 1
        },
        {
            "adult": true,
            "backdrop_path": "/evq3QFkEa94QwtoWMYeNTaaHhGM.jpg",
            "genre_ids": [
                16
            ],
            "id": 106920,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "琥珀色のハンター THE ANIMATION",
            "overview": "Fame and fortune await those courageous enough to venture into the remote sectors of the planet. Largely uninhabited and covered by dense forests, these monster-infested regions are abundant in a mysterious ore called the Nova Stone. The coveted stone overflows with energy, and those successful in their hunt are bound to acquire obscene amounts of wealth. Yet the frontier remains a dreadful place. The only ones capable of staving off imminent devastation to human settlements are the hunters. Since their weapons, powered by Nova Stone, are capable of vanquishing the beasts, these brave souls are tasked with the protection of otherwise defenseless towns.",
            "popularity": 0.0,
            "poster_path": "/9Jozql4tXEA27V5mZpJrXWu8tL2.jpg",
            "first_air_date": "2020-07-30",
            "name": "Amber-Coloured Hunter The Animation",
            "vote_average": 5.7,
            "vote_count": 3,
            "character": "Diana",
            "credit_id": "6146057904863800618795d8",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/lT8xZMZxlAZiMNIlYz9lmf3WrlD.jpg",
            "genre_ids": [
                16,
                10765
            ],
            "id": 99115,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "妖魔娼館へようこそ♥",
            "overview": "Welcome To The Courtesans Palace Of Mystics. You can have a variety of nonhuman prostitutes here. Tonight, please have fun with amorousness of bewitching, beautiful, pretty and very sexy prostitutes.",
            "popularity": 0.0,
            "poster_path": "/zu5x5dfKB58vKWui9tbruv1Qei6.jpg",
            "first_air_date": "2020-02-07",
            "name": "Youma Shoukan e Youkoso",
            "vote_average": 10.0,
            "vote_count": 2,
            "character": "Chris / Maria Saint (voice)",
            "credit_id": "61727a041d019100441db99f",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/9mq0BrhlOFq7wpId2PJzb8zILtK.jpg",
            "genre_ids": [
                16
            ],
            "id": 97146,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "ましゅまろ★いもうと★さっきゅばす★",
            "overview": "Based on the erotic game by Dwarfsoft.",
            "popularity": 0.0,
            "poster_path": "/eeJpChIl8HX7TFUDB37dAii8KsY.jpg",
            "first_air_date": "2016-03-18",
            "name": "Marshmallow, Imouto, Succubus",
            "vote_average": 6.0,
            "vote_count": 1,
            "character": "Riri Manabe (voice) (credited as Mei Misonoo)",
            "credit_id": "61b6840bfa4046008708867b",
            "episode_count": 2
        },
        {
            "adult": true,
            "backdrop_path": "/qnwsI2OpAhP1bIeZiTW8Jv5E4T6.jpg",
            "genre_ids": [
                16
            ],
            "id": 209664,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "鬼作令和版",
            "overview": "",
            "popularity": 0.0,
            "poster_path": "/q4macExWOUvu9LYJKXFYTF2gaUs.jpg",
            "first_air_date": "2022-08-26",
            "name": "Kisaku Reiwa",
            "vote_average": 6.0,
            "vote_count": 1,
            "character": "Himeno Yuuri (voice)",
            "credit_id": "631c7cecfa4046008369d097",
            "episode_count": 1
        },
        {
            "adult": false,
            "backdrop_path": "/akW2Vt85HZ6qtUjDt1JTtQqB3Jm.jpg",
            "genre_ids": [
                16
            ],
            "id": 233643,
            "origin_country": [
                "JP"
            ],
            "original_language": "ja",
            "original_name": "しーくれっとみっしょん～潜入捜査官は絶対に負けない！～",
            "overview": "The story follows two undercover agents Riko Ikazuchi and her junior partner Noma, who are infiltrating an apartment that is also the hideout of a criminal organization. They pretend to be newlyweds. However, when the culprits do not hear noise from them at night, they get suspicious. In order to convince the culprits that they are a married in couple in love, they start to touch and make some noise... Despite feelings of humiliation and pleasure throughout the undercover investigations, Riko endures it and devotes herself to her justice.",
            "popularity": 830.675,
            "poster_path": "/ipqu76qqHiVB2vlK2gGZNwF9SwX.jpg",
            "first_air_date": "2023-10-02",
            "name": "Secret Mission: Sennyuu Sousakan wa Zettai ni Makenai!",
            "vote_average": 5.438,
            "vote_count": 8,
            "character": "Riko Ikazuchi (voice)",
            "credit_id": "64f095bdcaa50800c886d2ee",
            "episode_count": 5
        }
    ],
    "crew": [],
    "id": 1937988
}
""".data(using: .utf8)

let tvShowsKnownForResponse = try? JSONDecoder().decode(MovieAppKnownFor.self, from: tvShowsKnownForData!)

