//
//  SearchApiResponse.swift
//  Cobe
//
//  Created by Matko Mihaljl on 26.10.2022..
//

import Foundation
import SwiftUI


struct SearchAPIResponse: Codable{
    
    let show: Shows
    
    struct Shows: Codable{
        let id: Int
        let name: String
        let genres: [String]
        let premiered:  String
        let image: Image
        let summary: String
    }
    
    struct Image: Codable{
        let medium: URL?
        let original: URL?
    }
}


