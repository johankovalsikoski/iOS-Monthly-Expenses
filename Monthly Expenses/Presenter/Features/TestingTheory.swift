//
//  TestingTheory.swift
//  Monthly Expenses
//
//  Created by Johan Kovalsikoski on 31/10/23.
//

import SwiftUI

struct TestingTheory: View {
    var body: some View {
            VStack {
                Text("Red").frame(maxWidth: .infinity, minHeight: 0)
                
                Text("Red 2")
                
                HStack {
                    Text("Green")
                    
                    Text("Green 2")
                    
                    VStack {
                        Text("Blue")
                        
                        Text("Blue 2")
                    }.background(Color.blue)
                }.background(Color.green)
                
                Group {
                    List { // SÓ COMENTAR ESSA PORRA AQUI Ó!
                        Text("List")
                    }
                }
            }.background {
                Color.red
            }
        }
}

#Preview {
    TestingTheory()
}
