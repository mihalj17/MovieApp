//
//  DataService.swift
//  Cobe
//
//  Created by Matko Mihaljl on 19.10.2022..
//

import Foundation


final class DataService: DataServiceProtocol {
    
    func fetchJSON<T>(from url: URL?, completionHandler: @escaping (Result<[T], Error>) -> Void) where T : Decodable {
        guard let url = url else {
            return completionHandler(.failure(DataServiceError.badURL))
        }
      
        guard let data = try? Data(contentsOf: url) else {
            return completionHandler(.failure(DataServiceError.noInternet))
        }
        guard let decodeData = try? JSONDecoder().decode([T].self, from: data) else {
            return completionHandler(.failure(DataServiceError.badJson))
        }
        
        completionHandler(.success(decodeData))

    
    
    
    }
    
    
}
