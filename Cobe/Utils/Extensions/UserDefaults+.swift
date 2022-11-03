//
//  UserDefaults+.swift
//  Cobe
//
//  Created by Matko Mihaljl on 30.10.2022..
//

import Foundation


extension UserDefaults {
    
    func load<T>() -> T? where T: Decodable {
        let key = "\(T.self)"
        guard let data = self.object(forKey: key) as? Data else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func save<T>(_ t: T) where T: Encodable {
        guard let data = try? JSONEncoder().encode(t) else { return }
        let key = "\(T.self)"
        self.set(data, forKey: key)
    }
}
