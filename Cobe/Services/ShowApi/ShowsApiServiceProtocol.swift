//
//  ShowsApiServiceProtocol.swift
//  Cobe
//
//  Created by Matko Mihaljl on 19.10.2022..
//

import Foundation


protocol ShowsAPIServiceProtocol: AnyObject {
    
    func fetchShow(completionHandler: @escaping (Result<[ShowsAPIResponse],Error>) -> Void
    )
}
