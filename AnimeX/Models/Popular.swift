//
//  Popular.swift
//  AnimeX
//
//  Created by Brenna Murphy on 4/5/24.
//
import Foundation
struct popularAnime: Decodable{
    let name: String
    let rating: String?
    let score: Double?
    let originalUrl: URL
}
extension popularAnime {
    
    static var mockAnime: [popularAnime] = [
        popularAnime(name: "Attack on Titan",
                     rating: "TV-14",
                     score: 8.54,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/08/11-01-2019-00-38-27-9228227.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Death Note",
                     rating: "R",
                     score: 8.62,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/02/death-note-anime-poster.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Fullmetal Alchemist: Brotherhood",
                     rating: "TV-PG",
                     score: 9.1,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/08/fullmetal-alchemist-brotherhood.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "One-Punch Man",
                     rating: "R",
                     score: 8.5,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/08/AAAABaazw-uLC-MreJganqQyppcCRzItLXqsTSTvhJqIe-NIkZTzOYL-JgeABTgvUBhBHSAqj2rK81tesT5wV3bmvlSaxLxO.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "One Piece",
                     rating: "TV-14",
                     score: 8.9,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/12/one-piece.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "My Hero Academia",
                     rating: "PG-13",
                     score: 7.88,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/08/kbw6u93m59q01.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Naruto",
                     rating: "TV-PG",
                     score: 7.99,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/10/naruto-anime-cover-featuring-sakura-naruto-kakashi-sasuke.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Tokyo Ghoul",
                     rating: "TV-MA",
                     score: 7.79,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/12/the-cast-on-the-tokyo-ghoul-poster.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Hunter x Hunter",
                     rating: "NOT RATED",
                     score: 9.04,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/10/hunter-x-hunter-cast-gathered-together-on-the-cover.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Your Name",
                     rating: "PG-13",
                     score: 8.4,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/10/your-name-movie-poster.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Steins;Gate",
                     rating: "TV-14",
                     score: 9.07,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/02/steins-gate-anime-poster.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Jujustsu Kaisen",
                     rating: "TV-MA",
                     score: 8.63,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/02/jujutsu-kaisen-anime-poster.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "Frieren: Beyond Journey's End",
                     rating: "TV-14",
                     score: 9.13,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/12/frieren-beyond-journey-s-end.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "No Game No Life",
                     rating: "TV-14",
                     score: 8.07,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/01/no-game-no-life.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
        popularAnime(name: "A Silent Voice",
                     rating: "NOT RATED",
                     score: 9.93,
                     originalUrl: URL( string:"https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/10/a-silent-voice-anime-film-2017.jpg?q=50&fit=crop&w=480&dpr=1.5")!
                     
                    ),
    ]
}
