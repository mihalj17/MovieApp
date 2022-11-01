//
//  MovieData.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


struct MovieData: Codable{
    
    let movies: [MovieDataItem]
    let movieDataItem: MovieDataItem
    
    struct MovieDataItem: Codable{
    let id: Int
    let imageMovie: URL?
    
        func createMovieDataItemFromShowAPIResponse(_ movie: ShowsAPIResponse) -> MovieDataItem{
           return  MovieDataItem(id: movie.id, imageMovie: movie.image.medium)
        }
        func createMovieDataItemFromScheduleShowAPIResponse(_ movie: ScheduleAPIResponse) -> MovieDataItem{
            return  MovieDataItem(id: movie.id, imageMovie: movie.show.image?.medium)
        }
    }
    static var defaultData: Self {
        MovieData(movies: [], movieDataItem: MovieDataItem(id: 0, imageMovie: URL(string: "")))
    }
}
    
   
    
    
    
    

    

