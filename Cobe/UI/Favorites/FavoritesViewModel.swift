//
//  FavoritesViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 18.10.2022..
//

import Foundation
import SwiftUI


final class FavoritesViewModel: ObservableObject{
    private let persistenceService: PersistenceServiceProtocol
    @Published var favoritedMovies = [MovieDataArray]()
    init(persistenceService: PersistenceServiceProtocol){
        self.persistenceService = persistenceService
    }
    
    
    
    

}
