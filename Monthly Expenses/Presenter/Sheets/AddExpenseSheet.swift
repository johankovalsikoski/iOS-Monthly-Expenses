//
//  AddExpenseSheet.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI
import SwiftData

struct AddExpenseSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense name", text: $name)
                
                DatePicker("Date ", selection: $date, displayedComponents: .date)
                
                TextField("Value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = Expense(
                            name: name,
                            date: date,
                            value: value,
                            searchableDate: date.toYMDString()
                        )
                        
                        context.insert(expense)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddExpenseSheet()
}
