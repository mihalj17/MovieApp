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
    
    var onGoToDetails: ((_ object: T, _ cast:[CastAPIResponse]) -> Void)?
    
    @Published  var movies = [ShowsAPIResponse]()
    @Published var scheduleMovies = [ScheduleAPIResponse]()
    @Published var cast = [CastAPIResponse]()
    
    
    init(ShowsApiService: ShowsAPIServiceProtocol, ScheduleApiService: ScheduleAPIServiceProtocol, CastApiService: CastAPIServiceProtocol){
        self.ShowsApiService = ShowsApiService
        self.ScheduleApiService = ScheduleApiService
        self.CastApiService = CastApiService
        
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

}
