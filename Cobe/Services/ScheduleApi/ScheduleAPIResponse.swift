//
//  ScheduleAPIResponse.swift
//  Cobe
//
//  Created by Matko Mihaljl on 20.10.2022..
//

import Foundation
import SwiftUI

struct ScheduleAPIResponse: Identifiable, Codable{
    
    let id: Int
    let airdate: String
    let airtime: String
    let show: Show
    
    struct Show:Codable{
        let name: String
        let image: Image?
        let summary: String?
        
    }
    
    struct Image: Codable{
        let original: URL?
        let medium: URL?
    }
}
