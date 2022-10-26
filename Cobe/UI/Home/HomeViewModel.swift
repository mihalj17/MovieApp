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
    
    private let getAllShows: ShowsAPIServiceProtocol
    private let getScheduleShows: ScheduleAPIServiceProtocol
    private let getCast: CastAPIServiceProtocol
    
    var onGoToDetails: ((_ object: T, _ cast:[CastAPIResponse]) -> Void)?
    
    @Published  var movies = [ShowsAPIResponse]()
    @Published var scheduleMovies = [ScheduleAPIResponse]()
    @Published var cast = [CastAPIResponse]()
    
    
    init(getAllShows: ShowsAPIServiceProtocol, getScheduleShows: ScheduleAPIServiceProtocol, getCast: CastAPIServiceProtocol){
        self.getAllShows = getAllShows
        self.getScheduleShows = getScheduleShows
        self.getCast = getCast
        
    }
    
    func show(){
        DispatchQueue.main.async { [self] in
        getAllShows.fetchShow{ result in
                switch(result){
                case .success(let response):
                    let movie = response
                    DispatchQueue.main.async {
                        self.movies.append(contentsOf: movie)}
                case.failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
        DispatchQueue.main.async { [self] in
        getScheduleShows.fetchShow { result in
                switch(result){
                case .success(let response):
                    let scheduleShow = response
                    DispatchQueue.main.async {
                        self.scheduleMovies.append(contentsOf: scheduleShow)}
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
        
        
        
        
    }
    func getCast(_ movie: Int){
        
            getCast.fetchShow(from: movie) { result in
                switch(result){
                case .success(let response):
                    let castItem = response
                    self.cast.append(contentsOf: castItem)
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

}
