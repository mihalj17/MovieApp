//
//  SearchViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation


final class SearchViewModel : ObservableObject{
    
    private let castAPIService: CastAPIServiceProtocol
    private let searchApiService: SearchAPIServiceProtocol
    private let showsAPIResponse: ShowsAPIResponse
    
    var onGoToDetails: ((_ movie: ShowsAPIResponse, _ cast: [CastAPIResponse]) -> Void)?
    
    @Published  var actors = [CastAPIResponse]()
    @Published  var searchedMovies = [SearchAPIResponse]()
    
    init(searchApiService: SearchAPIServiceProtocol, castAPIService: CastAPIServiceProtocol,showsAPIResponse: ShowsAPIResponse ){
        self.searchApiService = searchApiService
        self.castAPIService = castAPIService
        self.showsAPIResponse = showsAPIResponse
    }
    
    func getSearchMovie(_ movie: String){
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.searchApiService.fetchShow(from: movie) { result in
                DispatchQueue.main.async {
                    switch(result){
                    case .success(let response):
                        let castItem = response
                        self.searchedMovies.insert(contentsOf: castItem, at: 0)
                    case .failure(let error):
                        print("error \(error.localizedDescription)")
                        
                    }
                }
            }
        }
    }
    func emptySearchedCast(){
        for _ in searchedMovies.enumerated().reversed() {
            searchedMovies.removeAll()
        }
        
    }
    func createShows(_ movie: SearchAPIResponse) -> ShowsAPIResponse{
        let show = showsAPIResponse.createShowApiResponseFromSearch(movie)
        return show
    }
    
    func getActorsData(_ movie: Int){
        self.castAPIService.fetchShow(from: movie) { result in
            switch(result){
            case .success(let response):
                let cast = response
                self.actors.insert(contentsOf: cast, at: 0)
            case .failure(let error):
                print("error  \(error.localizedDescription)")
            }
        }
    }
}


