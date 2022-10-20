//
//  HomeViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation


final class HomeViewModel: ObservableObject{
    private let getAllShows: ShowsAPIServiceProtocol
    @Published  var movies = [ShowsAPIResponse]()
    init(getAllShows: ShowsAPIServiceProtocol){
        self.getAllShows = getAllShows
    }
   
    func show(){
        getAllShows.fetchShow{ result in
            DispatchQueue.main.async {
            switch(result){
            case .success(let response):
               let movie = response
                self.movies.append(contentsOf: movie)
                print(self.movies)
            case.failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
        }
    }
    
   
}
