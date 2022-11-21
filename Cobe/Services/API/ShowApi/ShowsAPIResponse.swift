//
//  ShowsAPIResponse.swift
//  Cobe
//
//  Created by Matko Mihaljl on 19.10.2022..
//

import Foundation
import SwiftUI

struct ShowsAPIResponse: Identifiable, Codable{

    
    let id: Int
    let name: String
    let summary: String
    let premiered: String
    let image: Photo
    let rating: Rating
    
    struct Photo: Codable {
        let medium: URL?
        let original: URL?
    }
    
    struct Rating: Codable{
        let average: Double?
    }
    
    func createShowApiResponseFromSearch(_ movie: SearchAPIResponse) -> ShowsAPIResponse{
        return ShowsAPIResponse(id: movie.show.id, name: movie.show.name, summary: movie.show.summary , premiered: "", image: Photo(medium: movie.show.image.medium, original: movie.show.image.original), rating: Rating(average: 0.0))
    }
    
    func createShowApiResponseFromFavorites(_ movie: FavoriteMovieData.Favorite) -> ShowsAPIResponse{
        return ShowsAPIResponse(id: movie.id, name: "", summary: movie.summary, premiered: "", image: Photo(medium: movie.imageMovie, original: movie.imageMovie), rating: Rating(average: 0.0))
    }
    
    static var defaultData: Self {
        ShowsAPIResponse(id: 0, name: "X", summary: "x", premiered: "x", image:  Photo(medium: URL(string: ""), original: URL(string: "")), rating: Rating(average: 0.0))
    }
    
}
