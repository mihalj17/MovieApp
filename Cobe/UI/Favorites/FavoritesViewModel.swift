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
    @Published var favoritedMovies = [FavoriteMovieData.Favorite]()
    @Published var isMovieSaved = Bool()
    
    init(PersistenceService: PersistenceServiceProtocol){
        self.PersistenceService = PersistenceService
    }
    
    func loadFavoriteArray(){
        favoritedMovies = PersistenceService.movieData.movies
    }
    
    
    func checkFavoriteMovie(_ movie: FavoriteMovieData.Favorite) -> Bool {
        let favoritedMovies = PersistenceService.movieData.movies
        for movieItem in favoritedMovies {
            if  movieItem.id == movie.id{
                return true
            }
            
        }
        return false
    }
    
    func toggleFavorite(_ movie: FavoriteMovieData.Favorite){
        var favoritedMovies = PersistenceService.movieData.movies
        
        if checkFavoriteMovie(movie){
            if let movieIndex = favoritedMovies.firstIndex(where: {$0.id == movie.id}){
                favoritedMovies.remove(at: movieIndex)
                isMovieSaved = false
            }
        }
        else {
            favoritedMovies.insert(movie.self, at: 0)
            isMovieSaved = true
        }
        PersistenceService.movieData = FavoriteMovieData(movies: favoritedMovies, movieDataItem: movie, isChecked: isMovieSaved)
    }
    
    func persistFavorite(_ iconChecked: Bool){
        let checked = PersistenceService.movieData.isChecked(iconChecked)
        PersistenceService.movieData.isChecked = checked
    }
    
}
