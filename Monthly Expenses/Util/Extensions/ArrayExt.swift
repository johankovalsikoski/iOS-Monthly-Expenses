//
//  ArrayExt.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 07/11/23.
//

import Foundation

extension Array where Element: Expense {
    func sumUp(date: String) -> String {
        var total = 0.0
        
        self.filter {
            $0.searchableDate.contains(date)
        }.forEach {
            total += $0.value
        }
        
        return total.formatAsTwoDecimalPlacesString
    }
}
