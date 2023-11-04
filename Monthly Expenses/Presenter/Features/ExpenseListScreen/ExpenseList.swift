//
//  ExpenseList.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 03/11/23.
//

import SwiftUI
import SwiftData

struct ExpenseList: View {
    @Environment(\.modelContext) private var context

    @State private var showAddExpenseSheet = false
    @State private var expenseToEdit: Expense?
    
    @Query private var expenseList: [Expense]
    
    let filterByDate: String
    
    init(filterByDate: String) {
        self.filterByDate = filterByDate

        _expenseList = Query(
            filter: #Predicate<Expense> {
                $0.searchableDate == filterByDate
            }, animation: .default
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenseList) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete(perform: deleteExpense) // built in delete allows swipe to delete
                
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $showAddExpenseSheet) {
                AddExpenseSheet()
            }
            .sheet(item: $expenseToEdit) { expense in
                UpdateExpenseSheet(expense: expense)
            }
            .toolbar { // placement starts from left to right aligned by trailing
                if !expenseList.isEmpty {
                    Button("Add Expense", systemImage: "plus") { // Button Label is required and not shown due to systemImage
                        showAddExpenseSheet = true
                    }
                }
                
            }
            .overlay {
                if expenseList.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list.")
                    }, actions: {
                        Button("Add Expense") { showAddExpenseSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
    
    func deleteExpense(indexes: IndexSet) {
        for index in indexes {
            context.delete(expenseList[index])
        }
    }
}

#Preview {
    ExpenseList(filterByDate: "23/11/27")
}
