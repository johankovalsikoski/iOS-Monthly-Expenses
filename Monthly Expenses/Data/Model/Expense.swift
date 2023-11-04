//
//  Expense.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var date: Date
    var value: Double
    var searchableDate: String
    
    init(name: String, date: Date, value: Double, searchableDate: String) {
        self.name = name
        self.date = date
        self.value = value
        self.searchableDate = searchableDate
    }
    
}
