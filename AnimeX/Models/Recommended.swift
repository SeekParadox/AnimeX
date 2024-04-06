//
//  Recommended.swift
//  AnimeX
//
//  Created by Alyssa Yesilyurt on 4/6/24.
//

import Foundation

struct recommendedManhwa: Decodable{
    let name: String
    let author: String
    let publisher: String
    let status: String
    let summary: String
    let originalUrl: URL
}

extension recommendedManhwa {
    static var mockManhwa: [recommendedManhwa] = [
        recommendedManhwa(name: "Under the Oak Tree",
                    author: "Suji Kim",
                    publisher: "Ridibooks/Manta Comics",
                    status: "ongoing",
                    summary: "Love is a fairytale. Or is it? Stuttering lady Maximilian is forced into a marriage with Sir Riftan, but he leaves on a campaign after their wedding night. 3 years later, he triumphantly returns, ready to cherish her. All fairytales end with a wedding and a happily-ever-after. Their love began with a wedding — this is no fairytale.",
                    originalUrl: URL( string:"https://usc1.contabostorage.com/scraper/mangas/65b77dabbf13b1bd72cf58a8/thumb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=c10e9464b360c31ce8abea9b266076f6%2F20240406%2Fdefault%2Fs3%2Faws4_request&X-Amz-Date=20240406T192853Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=abb3fce8b2b19ad5c03c53feea9fb22f6f1134c888b677e4b53fdb86d7011682")!
                    ),
        recommendedManhwa(name: "Disobey the Duke if You Dare",
                    author: "Romance Machine K",
                    publisher: "Ridibooks/Manta Comics",
                    status: "completed",
                    summary: "Once you see who I truly am, this marriage will become far worse. After her second husband's death, Lily is forced into a third marriage by her father. Her new husband is rumored to be a monstrous warmonger, but to Lily's surprise, the Duke turns out to be a kind man and husband. There's just one catch... she must never see his face.",
                     originalUrl: URL( string:"https://m.media-amazon.com/images/I/91mOxta6y8L._AC_UF1000,1000_QL80_.jpg")!
                    ),
        recommendedManhwa(name: "Ghost on the Roof",
                    author: "Klaus Scrimshaw",
                    publisher: "Webtoon",
                    status: "ongoing",
                    summary: "In modern-day Paris, 20-year old Christine Daaé is an aspiring opera singer whose dreams were shattered by a traumatic incident during an audition one year ago. She has all but given up on returning to the stage, until a mysterious voice on the roof of the Paris Opera House offers her the chance to get her life back.",
                    originalUrl: URL( string:"https://swebtoon-phinf.pstatic.net/20220730_75/1659135955141M1fSb_JPEG/4GhostontheRoof_landingpage_mobile_.jpg?type=crop540_540")!
                    ),
        recommendedManhwa(name: "Adeline's Darkest Night",
                    author: "Lee Hyeonsung",
                    publisher: "Manta Comics",
                    status: "completed",
                    summary: "Murdered by the man she loved. Adeline Rotyn gave everything to her husband, Duke Venzak. That is, until he kills her one dark and stormy night. Instead of dying, she finds herself transported years into the past. Determined to make the most of her second chance at life, she vows to become stronger and escape her horrid fate.",
                    originalUrl: URL( string:"https://static.manta.net/2023-01-05/KW/KWpsGnXj2e6zDdla.jpg")!
                     
                    ),
        recommendedManhwa(name: "The Emperor's Mask",
                    author: "Yeoldu",
                    publisher: "Manta Comics",
                    status: "completed",
                    summary: "Imagine blacking out and waking up in a different world! A teacher finds herself in the body of Lady Lucia, a woman who committed suicide. While trying to understand what happened, she realizes Lucia was actually murdered. Why does the emperor hide behind a mask? And what really happened to Lucia…?",
                    originalUrl: URL( string:"https://static.manta.net/2021-06-23/NX/NXkY841PQRhgsoBE.jpg")!
                    ),
        recommendedManhwa(name: "Amina of the Lamp",
                    author: "Eeyeol Chun",
                    publisher: "Ridibooks/Manta Comics",
                    status: "completed",
                    summary: "Amina, one of the last wizards, loses her loved ones when her palace comes under attack. Trying to turn back time to save them, she gets stuck inside a lamp. 300 years later, Jakard, a military commander, wakes her up. He has three wishes before Amina returns to the lamp. What will he wish for?",
                    originalUrl: URL( string:"https://pbs.twimg.com/media/GFbIDPsXsAAos5O.jpg")!
                    ),
        recommendedManhwa(name: "Finding Camellia",
                    author: "Jin Soye",
                    publisher: "Ridibooks/Manta Comics",
                    status: "completed",
                    summary: "Camellia was just 12 when she was taken away from her mother in the slums and forced to live as the son of an aristocratic family. But under the layers of secrets and lies, she never forgets. She continues to struggle to be her true self again, to reclaim the life of Camellia.",
                    originalUrl: URL( string:"https://static.wikia.nocookie.net/web-fiction/images/0/02/Finding_Camellia.jpg/revision/latest?cb=20230114060003")!
                    ),
        recommendedManhwa(name: "Lore Olympus",
                    author: "Rachel Smythe",
                    publisher: "Webtoon",
                    status: "ongoing",
                    summary: "Persephone, young goddess of spring, is new to Olympus. Her mother, Demeter, has raised her in the mortal realm, but finally she moves to the glamorous world of the gods. When her roommate, Artemis, takes her to a party, her entire life changes: she ends up meeting Hades and feels an immediate spark with the charming yet misunderstood ruler of the Underworld. Now Persephone must navigate the confusing politics and relationships that rule Olympus, while also figuring out her own place—and her own power.",
                          originalUrl: URL( string:"https://m.media-amazon.com/images/I/81TywkHV+7L._AC_UF1000,1000_QL80_.jpg")!
                    ),
        recommendedManhwa(name: "I Raised a Black Dragon",
                    author: "Dalseul",
                    publisher: "Ridibooks/Manta Comics",
                    status: "completed",
                    summary: "After dying from overwork, Noa ends up possessing the body of Eleanora, the villainess from a novel. Noa simply wants to lead a peaceful life and tries not to interfere with the original story. That is, until a baby dragon that’s meant to imprint on the heroine imprints on her instead...",
                    originalUrl: URL( string:"https://static.manta.net/2024-01-11/kT/kT1ShMKCNkKqdFpB.jpg")!
                    ),
        recommendedManhwa(name: "The Maid and the Vampire",
                    author: "Dolce Yi, Seon Lee, Yujeong Ju",
                    publisher: "Tappytoon/NetComics",
                    status: "completed",
                    summary: "Areum has fallen into a strange world called 'Soltera' after a car accident. She is mistaken for a vampire because of her hair color, and then sold to a duke's estate by a slave trader. Turns out the master of this house is Duke Millard Travis, the one and only vampire in the world!",
                    originalUrl: URL( string:"https://images-na.ssl-images-amazon.com/images/I/81XjBk5QByL._AC_UL600_SR600,600_.jpg")!
                     
                    ),
        recommendedManhwa(name: "Light and Shadow",
                    author: "Ryu Hyang",
                    publisher: "Hanbooks",
                    status: "completed",
                    summary: "It’s a rude insult when lowly and headstrong servant Edna comes to marry Duke Eli, instead of the noble daughter he expected. But the ambitious maid hides an even bigger secret behind her obvious ruse – one that could change the kingdom’s very history. Can the two find freedom, redemption – and love – without drawing their swords on each other?",
                    originalUrl: URL( string:"https://ccdn.lezhin.com/v2/comics/5509049443745792/images/tall.jpg?updated=1654762978950&width=840")!
                    ),
    ]
}

