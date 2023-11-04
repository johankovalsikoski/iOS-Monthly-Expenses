//
//  UpdateExpenseSheet.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI
import SwiftData

struct UpdateExpenseSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense: Expense
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense name", text: $expense.name)
                
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") {
                        $expense.wrappedValue.searchableDate = expense.date.toYMDString()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    UpdateExpenseSheet(expense: Expense(name: "Candies", date: .now, value: 50.0, searchableDate: "23/11/27"))
}
