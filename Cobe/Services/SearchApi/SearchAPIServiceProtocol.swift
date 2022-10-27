//
//  SearchApiServiceProtocol.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation


protocol SearchAPIServiceProtocol: AnyObject {
    
    func fetchShow(from searchString: String,completionHandler: @escaping (Result<[SearchAPIResponse],Error>) -> Void
    )
}
