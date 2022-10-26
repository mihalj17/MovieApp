//
//  SearchViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation


final class SearchViewModel : ObservableObject{
    
    private let getAllShows: ShowsAPIServiceProtocol
    @Published  var movies = [ShowsAPIResponse]()
    
    init(getAllShows: ShowsAPIServiceProtocol){
        self.getAllShows = getAllShows
    }
    
    
    func fetchShow(){
        DispatchQueue.main.async { [self] in
        getAllShows.fetchShow{ result in
                switch(result){
                case .success(let response):
                    let movie = response
                    DispatchQueue.main.async {
                        self.movies.append(contentsOf: movie)}
                    print("filmovi \(self.movies)")
                case.failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }

    }
}


