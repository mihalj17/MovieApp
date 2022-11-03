//
//  CastAPIRespnse.swift
//  Cobe
//
//  Created by Matko Mihaljl on 25.10.2022..
//

import Foundation


import SwiftUI

struct CastAPIResponse: Codable{

    
    
    let person: Person?
    
    struct Person:Codable{
        let id: Int
        let name: String
        let image: Image?
        let character: Charachter?
    }
    
    struct Image: Codable{
        let medium: URL?
        let original: URL?
    }

    struct Charachter: Codable{
        let name: String
    }
   
}
