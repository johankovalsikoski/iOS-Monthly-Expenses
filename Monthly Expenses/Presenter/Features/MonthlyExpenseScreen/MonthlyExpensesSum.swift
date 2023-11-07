//
//  MonthExpenseResume.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 07/11/23.
//

import SwiftUI
import SwiftData

struct MonthlyExpensesSum: View {
    @Query(sort: \Expense.date, animation: .default) private var expenseList: [Expense]
    
    let filterDate: String
    
    init(_ filterDate: String) {
        self.filterDate = String(filterDate.dropLast(2))
    }
    
    var body: some View {
        Text("Total: \(expenseList.sumUp(date: filterDate))")
    }
    
}

#Preview {
    MonthlyExpensesSum("23/11/27")
}
