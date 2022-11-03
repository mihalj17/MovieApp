//
//  DetailsViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//

import Foundation

class DetailsViewModel<T>: ObservableObject {
    
    var onDismissed: (() -> Void)?
    
    let data: T
    let cast: [CastAPIResponse]
    init(data: T, cast: [CastAPIResponse]){
        
        self.data = data
        self.cast = cast
        
    }
}



