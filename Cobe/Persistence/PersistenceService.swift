//
//  File.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


final class PersistanceService: PersistenceServiceProtocol {
    
    var movieData: MovieData{
        
        get{
            UserDefaults.standard.load() ?? MovieData.defaultData
        }
        set{
            UserDefaults.standard.save(newValue)
        }
        
    }
}
