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
  let name: String
  let summary: String
  let image: Photo
    let rating: Rating
    
  struct Photo: Codable {
    let medium: URL?
    let original: URL?
    
  }
    struct Rating: Codable{
        let average: Double?
    }
}
