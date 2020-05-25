//
//  String+Ext.swift
//  ios-actions-demo
//
//  Created by Juraj Hilje on 25/05/2020.
//  Copyright © 2020 Juraj Hilje. All rights reserved.
//

import Foundation

extension String {
    
    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
        var count = 0
        var returnValue = self

        while let range = returnValue.range(of: search) {
            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
            count += 1

            // exit as soon as we've made all replacements
            if count == maxReplacements {
                return returnValue
            }
        }

        return returnValue
    }
    
    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }

        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]

        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    
    func base64KeyToHex() -> String? {
        let base64 = self
        
        guard base64.count == 44 else {
            return nil
        }
        
        guard base64.last == "=" else {
            return nil
        }
        
        guard let keyData = Data(base64Encoded: base64) else {
            return nil
        }
        
        guard keyData.count == 32 else {
            return nil
        }
        
        let hexKey = keyData.reduce("") {$0 + String(format: "%02x", $1)}
        
        return hexKey
    }
    
    func camelCaseToCapitalized() -> String? {
        let pattern = "([a-z0-9])([A-Z])"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1 $2").lowercased().capitalized
    }
    
}
