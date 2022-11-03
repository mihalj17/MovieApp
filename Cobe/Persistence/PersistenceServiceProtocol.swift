//
//  PersistenceServiceProtocol.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


protocol  PersistenceServiceProtocol: AnyObject{
    
    var movieData: FavoriteMovieData { get set }
}
