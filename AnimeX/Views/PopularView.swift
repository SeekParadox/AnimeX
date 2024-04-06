//
//  FeedView.swift
//  AnimeX
//
//  Created by Brenna Murphy on 3/31/24.
//

import SwiftUI
import Foundation
struct PopularView: View {
    let animeList = popularAnime.mockAnime
    var body: some View {
        NavigationView {
            List(animeList, id: \.name) { anime in
                HStack {
                    AsyncImage(url: anime.originalUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Shows a loader while the image is loading
                        case .success(let image):
                            image.resizable() // Display the loaded image
                        case .failure:
                            Image(systemName: "photo") // Shows a placeholder image in case of failure
                        @unknown default:
                            EmptyView() // Fallback for future cases
                        }
                    }
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    VStack(alignment: .leading) {
                        Text(anime.name)
                            .font(.headline)
                        
                        if let rating = anime.rating {
                            Text("Rating: \(rating.uppercased())")
                                .font(.subheadline)
                        }
                        
                        if let score = anime.score {
                            Text("Score: \(score, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Popular Anime")
        }
    }
}
struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}

