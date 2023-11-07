//
//  DoubleExt.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 07/11/23.
//

import Foundation

extension Double {
    var formatAsTwoDecimalPlacesString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "0,00"
    }
}
