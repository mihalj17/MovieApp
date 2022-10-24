//
//  HomeViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import UIKit


class HomeViewModel<T>: ObservableObject{
    private let getAllShows: ShowsAPIServiceProtocol
    private let getScheduleShows: ScheduleAPIServiceProtocol
    var onGoToDetails: ((_ object: T) -> Void)?
    @Published  var movies = [ShowsAPIResponse]()
    @Published var scheduleMovies = [ScheduleAPIResponse]()
    init(getAllShows: ShowsAPIServiceProtocol, getScheduleShows: ScheduleAPIServiceProtocol){
        self.getAllShows = getAllShows
        self.getScheduleShows = getScheduleShows
        
    }
    
    func show(){
        getAllShows.fetchShow{ result in
            DispatchQueue.main.async {
                switch(result){
                case .success(let response):
                    let movie = response
                    self.movies.append(contentsOf: movie)
                case.failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
        
        getScheduleShows.fetchShow { result in
            DispatchQueue.main.async {
                switch(result){
                case .success(let response):
                    let scheduleShow = response
                    self.scheduleMovies.append(contentsOf: scheduleShow)
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
        
    }
    
    
}


