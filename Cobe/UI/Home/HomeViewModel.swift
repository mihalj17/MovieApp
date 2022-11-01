//
//  HomeViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit
import SwiftUI


class HomeViewModel<T>: ObservableObject{
    
    private let ShowsApiService: ShowsAPIServiceProtocol
    private let ScheduleApiService: ScheduleAPIServiceProtocol
    private let CastApiService: CastAPIServiceProtocol
    private let PersistenceService: PersistenceServiceProtocol
    
    var onGoToDetails: ((_ object: T, _ cast:[CastAPIResponse]) -> Void)?
    
    @Published  var movies = [ShowsAPIResponse]()
    @Published var scheduleMovies = [ScheduleAPIResponse]()
    @Published var cast = [CastAPIResponse]()
    @Published var isFavorite = Bool()
    
    
    init(ShowsApiService: ShowsAPIServiceProtocol, ScheduleApiService: ScheduleAPIServiceProtocol, CastApiService: CastAPIServiceProtocol, PersistenceService: PersistenceServiceProtocol ){
        self.ShowsApiService = ShowsApiService
        self.ScheduleApiService = ScheduleApiService
        self.CastApiService = CastApiService
        self.PersistenceService = PersistenceService
        
    }
    
    func fetchShowInfo(){
        ShowsApiService.fetchShow{ [weak self] result in
                switch(result){ 
                case .success(let response):
                    let movie = response
                    self?.movies.insert(contentsOf:movie.self, at: 0)
//                    self.movies.append(contentsOf: movie)
                case.failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
    }
    
    func fetchScheduleShowInfo(){
        ScheduleApiService.fetchShow { [weak self] result in
                switch(result){
                case .success(let response):
                    let scheduleShow = response
                    self?.scheduleMovies.insert(contentsOf:scheduleShow.self, at: 0)
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
    }
    
    func getCastInfo(_ movie: Int){
        
        CastApiService.fetchShow(from: movie) { [weak self]  result in
                switch(result){
                case .success(let response):
                    let castItem = response
//                    self.cast.append(contentsOf: castItem)
                    self?.cast.insert(contentsOf:castItem.self, at: 0)
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                    
                }
            }
        
        
        
       
        
    }
  
    
func emptyCast(){
        for _ in cast.enumerated().reversed() {
            cast.removeAll()
        }
        
    }
    
//    func contains(where predicate: (Self.Element) throws -> Bool) rethrows -> Bool
    
    func contains(_ movie: MovieData.MovieDataItem) -> Bool {
        let favoritedMovies = PersistenceService.movieData.movies
        for movieItem in favoritedMovies {
            if  movieItem.id == movie.id{
                return true
            }

        }
           return false
        }
        
    
    func toggleFavShow(_ movie: ShowsAPIResponse){
        let newfavoriteMovie = PersistenceService.movieData.movieDataItem.createMovieDataItemFromShowAPIResponse(movie)
        var favoritedMovies = PersistenceService.movieData.movies

        if contains(newfavoriteMovie){
            if let movieIndex = favoritedMovies.firstIndex(where: {$0.id == movie.id}){
                favoritedMovies.remove(at: movieIndex)
                isFavorite = false
            }
        }
        else {
            favoritedMovies.insert(newfavoriteMovie.self, at: 0)
            isFavorite = true
        }
        
        PersistenceService.movieData = MovieData(movies: favoritedMovies, movieDataItem: newfavoriteMovie)
        
        

    }
    
    func toggleFavScheduleShow(_ movie: ScheduleAPIResponse){
        let newfavoriteMovie = PersistenceService.movieData.movieDataItem.createMovieDataItemFromScheduleShowAPIResponse(movie)
        var favoritedMovies = PersistenceService.movieData.movies

        if contains(newfavoriteMovie){
            if let movieIndex = favoritedMovies.firstIndex(where: {$0.id == movie.id}){
                favoritedMovies.remove(at: movieIndex)
                isFavorite = false
            }
        }
        else {
            favoritedMovies.insert(newfavoriteMovie.self, at: 0)
            isFavorite = true
        }
        
        PersistenceService.movieData = MovieData(movies: favoritedMovies, movieDataItem: newfavoriteMovie)
        
        

    }


}
