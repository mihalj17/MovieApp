//
//  MovieData.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


struct FavoriteMovieData: Codable{
    
    let movies: [Favorite]
    let movieDataItem: Favorite
    var isChecked: Bool
    
    struct Favorite: Codable{
        let id: Int
        let imageMovie: URL?
        let summary: String
        
        func createMovieDataItemFromShowAPIResponse(_ movie: ShowsAPIResponse) -> Favorite{
            return  Favorite(id: movie.id, imageMovie: movie.image.medium, summary: movie.summary)
        }
        func createMovieDataItemFromScheduleShowAPIResponse(_ movie: ScheduleAPIResponse) -> Favorite{
            return  Favorite(id: movie.id, imageMovie: movie.show.image?.medium, summary: movie.show.summary ?? "X")
        }
    }
    mutating func isChecked(_ bool: Bool) -> Bool {
        isChecked = bool
        return isChecked
    }
    static var defaultData: Self {
        FavoriteMovieData(movies: [], movieDataItem: Favorite(id: 0, imageMovie: URL(string: ""), summary: ""), isChecked: false)
    }
}









