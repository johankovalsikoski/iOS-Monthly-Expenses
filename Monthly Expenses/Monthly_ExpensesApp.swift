//
//  Monthly_ExpensesApp.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI
import SwiftData

/**
 TODO:
 - [] Add and Expense Sheet Currency TextField needs adjustment
 - [DONE] Sum up expenses value by month/day
 - [] Preview isn't working after ExpenseSumUp View and ArrayExt were implemented
*/

@main
struct Monthly_ExpensesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Expense.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabViewExpense()
        }
        .modelContainer(sharedModelContainer)
    }
}
