//
//  MovieData.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


struct MovieDataArray: Codable{
    
    let movies: [MovieData]
    
    struct MovieData: Codable{
    let id: Int
    let imageMovie: URL?
    let isFavorite: Bool
    }
    
//    func fromShowToMovieData(_ movie : ShowsAPIResponse) -> MovieData{
//        return MovieData(id: movie.id, imageMovie: movie.image.medium, isFavorite: isFavorite )
//    }
    
    

    
}
