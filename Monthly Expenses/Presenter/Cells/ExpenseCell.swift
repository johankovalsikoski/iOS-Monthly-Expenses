//
//  ExpenseCell.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI

struct ExpenseCell: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(
                expense.date,
                format: .dateTime.month(.abbreviated).day()
            ).frame(width: 70, alignment: .leading)
            
            Text(expense.name)
            
            Spacer()
            
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
}

#Preview {
    ExpenseCell(expense: Expense(name: "Candies", date: .now, value: 50.0, searchableDate: "23/11/27"))
}
