//
//  HomeViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation


final class HomeViewModel: ObservableObject{
    private let getAllShows: ShowsAPIServiceProtocol
    private let getScheduleShows: ScheduleAPIServiceProtocol
    
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
