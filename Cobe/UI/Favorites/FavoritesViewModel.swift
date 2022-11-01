//
//  FavoritesViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import SwiftUI


final class FavoritesViewModel: ObservableObject{
    private let PersistenceService: PersistenceServiceProtocol
    @Published var favoritedMovies = [MovieData.MovieDataItem]()
    init(PersistenceService: PersistenceServiceProtocol){
        self.PersistenceService = PersistenceService
    }
    
    func load(){
        favoritedMovies = PersistenceService.movieData.movies
    }
    
    func contains(_ movie: MovieData.MovieDataItem) -> Bool {
        let favoritedMovies = PersistenceService.movieData.movies
        for movieItem in favoritedMovies {
            if  movieItem.id == movie.id{
                return true
            }

        }
           return false
        }
    
    
    func toggleShow(_ movie: MovieData.MovieDataItem){
        var favoritedMovies = PersistenceService.movieData.movies

        if contains(movie){
            if let movieIndex = favoritedMovies.firstIndex(where: {$0.id == movie.id}){
                favoritedMovies.remove(at: movieIndex)
            }
        }
        else {
            favoritedMovies.insert(movie.self, at: 0)
        }
        
        PersistenceService.movieData = MovieData(movies: favoritedMovies, movieDataItem: movie)
        

    }
}
