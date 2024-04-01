//
//  ExpensesModel.swift
//  Expenses_App
//
//  Created by Mikhail Demichev on 13.03.2024.
//

import Foundation

protocol Expendable: Identifiable, Equatable, Codable {
    var types: [String] { get }
    var name: String { get }
    var type: String { get }
    var amount: Double { get }
}

struct ExpenseItem: Expendable {
    var id = UUID()
    var types = ["Buisnes", "Personal", "House services", "Groceries"]
    var name: String
    var type: String
    var amount: Double
}
