//
//  CastApiServiceProtocol.swift
//  Cobe
//
//  Created by Matko Mihaljl on 25.10.2022..
//

import Foundation




protocol CastAPIServiceProtocol: AnyObject {
    
    func fetchShow(from cast: Int ,completionHandler: @escaping (Result<[CastAPIResponse],Error>) -> Void)
}
