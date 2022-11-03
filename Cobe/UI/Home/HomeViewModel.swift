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
    @Published var isFavoriteChecked = Bool()
    
    
    init(ShowsApiService: ShowsAPIServiceProtocol, ScheduleApiService: ScheduleAPIServiceProtocol, CastApiService: CastAPIServiceProtocol, PersistenceService: PersistenceServiceProtocol ){
        self.ShowsApiService = ShowsApiService
        self.ScheduleApiService = ScheduleApiService
        self.CastApiService = CastApiService
        self.PersistenceService = PersistenceService
        
    }
    // MARK: - Fetching Show Data
    func fetchShowInfo(){
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.ShowsApiService.fetchShow{ result in
                DispatchQueue.main.async {
                    switch(result){
                    case .success(let response):
                        let movie = response
                        self.movies.insert(contentsOf:movie.self, at: 0)
                    case.failure(let error):
                        print("error \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    // MARK: - Fetching  Schedule Show Data
    func fetchScheduleShowInfo(){
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.ScheduleApiService.fetchShow { result in
                DispatchQueue.main.async {
                    switch(result){
                    case .success(let response):
                        let scheduleShow = response
                        self.scheduleMovies.insert(contentsOf:scheduleShow.self, at: 0)
                    case .failure(let error):
                        print("error \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    // MARK: - Fetching  Cast Data
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
    
    // MARK: - Emptying Cast Array
    func emptyCastArray(){
        for _ in cast.enumerated().reversed() {
            cast.removeAll()
        }
    }
    // MARK: - Checking Favorite Movie
    
    func checkFavoriteMovie(_ movie: FavoriteMovieData.Favorite) -> Bool {
        let favoritedMovies = PersistenceService.movieData.movies
        for movieItem in favoritedMovies {
            if  movieItem.id == movie.id{
                return true
            }
        }
        return false
    }
    // MARK: - Function mark/unmark Show Movie to Favorite
    func toggleFavoriteShow(_ movie: ShowsAPIResponse){
        let newfavoriteMovie = PersistenceService.movieData.movieDataItem.createMovieDataItemFromShowAPIResponse(movie)
        var favoritedMovies = PersistenceService.movieData.movies
        
        if checkFavoriteMovie(newfavoriteMovie){
            if let movieIndex = favoritedMovies.firstIndex(where: {$0.id == movie.id}){
                favoritedMovies.remove(at: movieIndex)
                isFavoriteChecked = false
            }
        }
        else {
            favoritedMovies.insert(newfavoriteMovie.self, at: 0)
            isFavoriteChecked = true
        }
        PersistenceService.movieData = FavoriteMovieData(movies: favoritedMovies, movieDataItem: newfavoriteMovie, isChecked: isFavoriteChecked )
    }
    
    // MARK: - Function mark/unmark ScheduleShow Movie to Favorite
    
    func toggleFavoriteScheduleShow(_ movie: ScheduleAPIResponse){
        let newfavoriteMovie = PersistenceService.movieData.movieDataItem.createMovieDataItemFromScheduleShowAPIResponse(movie)
        var favoritedMovies = PersistenceService.movieData.movies
        
        if checkFavoriteMovie(newfavoriteMovie){
            if let movieIndex = favoritedMovies.firstIndex(where: {$0.id == movie.id}){
                favoritedMovies.remove(at: movieIndex)
                isFavoriteChecked = false
            }
        }
        else {
            favoritedMovies.insert(newfavoriteMovie.self, at: 0)
            isFavoriteChecked = true
        }
        
        PersistenceService.movieData = FavoriteMovieData(movies: favoritedMovies, movieDataItem: newfavoriteMovie, isChecked: isFavoriteChecked)
    }
    
    // MARK: - PersistFavorite
    func persistFavorite(_ iconChecked: Bool){
        let checked = PersistenceService.movieData.isChecked(iconChecked)
        PersistenceService.movieData.isChecked = checked
    }
    
    // MARK: - Checking is ShowsMovie in Favorite Array
    func isMovieinFavoriteArray(_ movie: ShowsAPIResponse) -> Bool{
        let favorites = PersistenceService.movieData.movies
        for favorite in favorites {
            if favorite.id == movie.id {
                return true
            }
        }
        return false
    }
    
    // MARK: - Checking is ScheduleShowsMovie in Favorite Array
    
    func isScheduleMovieinFavoriteArray(_ movie: ScheduleAPIResponse) -> Bool{
        let favorites = PersistenceService.movieData.movies
        for favorite in favorites {
            if favorite.id == movie.id {
                return true
            }
        }
        return false
    }
    
}
