//
//  CastAPIService.swift
//  Cobe
//
//  Created by Matko Mihaljl on 25.10.2022..
//

import Foundation



final class CastAPIService: CastAPIServiceProtocol {
    
    
    init(){}
    func fetchShow(from cast: Int, completionHandler: @escaping (Result<[CastAPIResponse], Error>) -> Void){
        guard let url = URL(string: "https://api.tvmaze.com/shows/\(cast)/cast") else {
        return completionHandler(.failure(CastAPIError.badURLName))
    }
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
    
    
    private let dataService: DataServiceProtocol = DataService()
}
