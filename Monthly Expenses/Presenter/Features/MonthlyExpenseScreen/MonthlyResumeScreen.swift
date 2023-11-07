//
//  MonthlyResumeScreen.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 06/11/23.
//

import SwiftUI

struct MonthlyResumeScreen: View {
    @State private var currentExpenseDateShown: Date = .now
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button("", systemImage: "chevron.left") {
                        currentExpenseDateShown = Calendar.current.date(byAdding: .month, value: -1, to: currentExpenseDateShown)!
                    }
                    
                    Spacer()
                    
                    DatePicker(
                        "", selection: $currentExpenseDateShown, displayedComponents: .date
                    ).labelsHidden()
                        .opacity(0.0101) // MAGIC-ENABLING NUMBER FOR CLICK
                        .background(
                            Text(currentExpenseDateShown, format: .dateTime.month(.abbreviated).year()).foregroundColor(.white)
                        )
                    
                    Spacer()
                    
                    Button("", systemImage: "chevron.right") {
                        currentExpenseDateShown = Calendar.current.date(byAdding: .month, value: 1, to: currentExpenseDateShown)!
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background {
                        Color.blue
                    }.foregroundColor(.white)
                
                MonthlyExpenseList(currentExpenseDateShown.toYMDString())
                
                MonthlyExpensesSum(currentExpenseDateShown.toYMDString())
                
            }
        }
    }
}

#Preview {
    MonthlyResumeScreen()
}
