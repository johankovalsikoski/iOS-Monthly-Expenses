//
//  ContentView.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI

struct ExpenseListScreen: View {
    @State private var currentExpenseDateShown: Date = .now
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button("", systemImage: "chevron.left") {
                        currentExpenseDateShown = Calendar.current.date(byAdding: .day, value: -1, to: currentExpenseDateShown)!
                    }
                    
                    Spacer()
                    
                    DatePicker(
                        "", selection: $currentExpenseDateShown, displayedComponents: .date
                    ).labelsHidden()
                        .colorInvert()
                    
                    Spacer()
                    
                    Button("", systemImage: "chevron.right") {
                        currentExpenseDateShown = Calendar.current.date(byAdding: .day, value: 1, to: currentExpenseDateShown)!
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background {
                        Color.blue
                    }.foregroundColor(.white)
                
                ExpenseList(filterByDate: currentExpenseDateShown.toYMDString())
                
            }
        }
    }
    
}

#Preview {
    ExpenseListScreen()
        .modelContainer(for: Expense.self, inMemory: true)
}
