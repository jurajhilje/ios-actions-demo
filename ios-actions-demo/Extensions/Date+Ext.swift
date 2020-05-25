//
//  Date+Ext.swift
//  ios-actions-demo
//
//  Created by Juraj Hilje on 25/05/2020.
//  Copyright © 2020 Juraj Hilje. All rights reserved.
//

import Foundation

extension Date {
    
    func days(between otherDate: Date) -> Int {
        let calendar = Calendar.current

        let startOfSelf = calendar.startOfDay(for: self)
        let startOfOther = calendar.startOfDay(for: otherDate)
        let components = calendar.dateComponents([.day], from: startOfSelf, to: startOfOther)

        return abs(components.day ?? 0)
    }
    
}
