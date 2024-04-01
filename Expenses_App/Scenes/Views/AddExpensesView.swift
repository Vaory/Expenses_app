//
//  AddExpensesView.swift
//  Expenses_App
//
//  Created by Mikhail Demichev on 13.03.2024.
//

import SwiftUI

struct AddExpensesView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $expenses.item.name)
                
                Picker("Type", selection: $expenses.item.type) {
                    ForEach(expenses.item.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $expenses.item.amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .onAppear() {
                expenses.clearItem()
            }
            .toolbar {
                Button("Save") {
                    expenses.addItem()
                    dismiss()
                }
            }
        }
    }
}

struct AddExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpensesView(expenses: Expenses())
    }
}
