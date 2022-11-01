//
//  ShowsAPIResponse.swift
//  Cobe
//
//  Created by Matko Mihaljl on 19.10.2022..
//

import Foundation
import SwiftUI

struct ShowsAPIResponse: Identifiable, Codable{

    
    let id: Int
    let name: String
    let summary: String
    let premiered: String
    let image: Photo
    let rating: Rating
    let genres: [String]
    struct Photo: Codable {
        let medium: URL?
        let original: URL?
        
    }
    struct Rating: Codable{
        let average: Double?
    }
    
}
