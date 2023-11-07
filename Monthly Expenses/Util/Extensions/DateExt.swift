//
//  DateExt.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 03/11/23.
//

import Foundation

extension Date {
    func toYMDString(format: String = "yy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self).filter{ $0 != "-" }
    }
}
