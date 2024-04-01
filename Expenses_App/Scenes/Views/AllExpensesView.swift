//
//  AllExpensesView.swift
//  Expenses_App
//
//  Created by Mikhail Demichev on 13.03.2024.
//

import SwiftUI

struct AllExpensesView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpenses: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (expenses.items) { item in
                    HStack {
                        Image(expenses.imageName(for: item.type))
                            .resizable()
                            .frame(width: 35, height: 35)
                        Spacer().frame(width: 15)
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: expenses.removeItems)
            }
            .listStyle(.plain)
            
            .toolbar {
                Button {
                    showingAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .offset(x: -10)
                        .foregroundColor(.blue)
                        .bold()
                }
            }
            .onAppear() {
                expenses.loadItems()
            }
            .onChange(of: expenses.items) { _ in
                expenses.saveItems()
            }
            .sheet(isPresented: $showingAddExpenses) {
            AddExpensesView(expenses: expenses)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllExpensesView()
    }
}
