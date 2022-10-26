//
//  SearchApiService.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation



final class SearchAPIService: ScheduleAPIServiceProtocol {
    
    init(){}
    func fetchShow(completionHandler: @escaping (Result<[ScheduleAPIResponse], Error>) -> Void) {
        guard let url = URL(string: "https://api.tvmaze.com/schedule?country=US&date=2014-12-01") else {
        return completionHandler(.failure(ScheduleAPIError.badURLName))
    }
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
    
    
    private let dataService: DataServiceProtocol = DataService()
}
