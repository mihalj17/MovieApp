//
//  File.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


final class PersistanceService: PersistenceServiceProtocol {
    
    var movieData: MovieDataArray?{
        
        get{
            UserDefaults.standard.load()
        }
        set{
            UserDefaults.standard.save(newValue)
        }
        
    }
}
