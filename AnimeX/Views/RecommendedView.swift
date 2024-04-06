//
//  RecommendedView.swift
//  AnimeX
//
//  Created by Stephanie Yesilyurt on 4/1/24.
//

import SwiftUI
import Foundation

struct RecommendedView: View {
    let manhwaList = recommendedManhwa.mockManhwa
    var body: some View {
        NavigationView {
            List(manhwaList, id: \.name) { manhwa in
                HStack {
                    AsyncImage(url: manhwa.originalUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Shows a loader while the image is loading
                        case .success(let image):
                            image.resizable() // Display the loaded image
                            Text(manhwa.author)
                                .font(.caption2)
                            Text(manhwa.publisher)
                                .font(.caption2)
                        case .failure:
                            Image(systemName: "photo") // Shows a placeholder image in case of failure
                        @unknown default:
                            EmptyView() // Fallback for future cases
                        }
                    }
                    .frame(width: 140, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(manhwa.name)
                            .font(.headline)
                        
                        Text("Status: \(manhwa.status.capitalized)")
                            .font(.caption)
                            .fontWeight(.thin)
                        
                        Text(manhwa.summary)
                                .font(.caption)
                        Spacer()
                        Spacer()
                    }
                }
            }
            .navigationTitle("Suggested Manhwa")
            .padding(.top, 20)
        }
    }
}
struct ManhwaListView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
