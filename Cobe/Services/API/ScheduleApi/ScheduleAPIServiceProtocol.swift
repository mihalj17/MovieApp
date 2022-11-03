//
//  ScheduleApiServiceProtocol.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//

import Foundation

protocol ScheduleAPIServiceProtocol: AnyObject {
    
    func fetchShow(completionHandler: @escaping (Result<[ScheduleAPIResponse],Error>) -> Void
    )
}
