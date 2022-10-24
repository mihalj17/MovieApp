//
//  DetailsViewModel.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//

import Foundation

class DetailsViewModel<T>: ObservableObject {
    
     let data: T
     init(data: T){
        
         self.data = data
        
    }
}



