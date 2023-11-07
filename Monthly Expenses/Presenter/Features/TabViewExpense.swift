//
//  TabScreen.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 01/11/23.
//

import SwiftUI

struct TabViewExpense: View {
    
    var body: some View {
        TabView {
            MonthlyResumeScreen().tabItem {
                Label(
                    title: { Text("Monthly Expenses") },
                    icon: { Image(systemName: "list.bullet.rectangle") }
                )
            }
            
            DailyExpenseListScreen().tabItem {
                Label(
                    title: { Text("Daily Expenses") },
                    icon: { Image(systemName: "calendar") }
                )
            }
            
        }
        
    }
}

#Preview {
    TabViewExpense()
}
