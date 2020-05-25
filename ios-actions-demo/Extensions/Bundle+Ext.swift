//
//  Bundle+Ext.swift
//  ios-actions-demo
//
//  Created by Juraj Hilje on 25/05/2020.
//  Copyright © 2020 Juraj Hilje. All rights reserved.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from filename: String) -> T {
        guard let json = url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate \(filename) in app bundle.")
        }

        guard let jsonData = try? Data(contentsOf: json) else {
            fatalError("Failed to load \(filename) from app bundle.")
        }

        let decoder = JSONDecoder()

        guard let result = try? decoder.decode(T.self, from: jsonData) else {
            fatalError("Failed to decode \(filename) from app bundle.")
        }

        return result
    }
    
}
