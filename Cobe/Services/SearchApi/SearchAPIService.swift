//
//  SearchApiService.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation



final class SearchAPIService: SearchAPIServiceProtocol {
    
    init(){}
    func fetchShow(from searchString: String,completionHandler: @escaping (Result<[SearchAPIResponse], Error>) -> Void) {
        guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=\(searchString)") else {
        return completionHandler(.failure(ScheduleAPIError.badURLName))
    }
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
    
    
    private let dataService: DataServiceProtocol = DataService()
}
