//
//  ContentView.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI

struct DailyExpenseListScreen: View {
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
                
                DailyExpenseList(currentExpenseDateShown.toYMDString())
                
                DailyExpensesSum(currentExpenseDateShown.toYMDString())
                
            }
        }
    }
    
}

#Preview {
    DailyExpenseListScreen()
        .modelContainer(for: Expense.self, inMemory: true)
}
