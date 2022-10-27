//
//  SearchViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation


final class SearchViewModel : ObservableObject{
    
    private let getSearchMovie: SearchAPIServiceProtocol
    @Published  var searchedMovies = [SearchAPIResponse]()
    
    init(getSearchMovie: SearchAPIServiceProtocol){
        self.getSearchMovie = getSearchMovie
        
    }
    
    
    func getSearchMovie(_ movie: String){
        
            getSearchMovie.fetchShow(from: movie) { result in
                switch(result){
                case .success(let response):
                    let castItem = response
                    self.searchedMovies.insert(contentsOf: castItem, at: 0)
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                    
                }
            }
    }
    func emptySearchedCast(){
            for _ in searchedMovies.enumerated().reversed() {
                searchedMovies.removeAll()
            }
            
        }
}


