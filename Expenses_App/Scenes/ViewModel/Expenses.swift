//
//  Expenses.swift
//  Expenses_App
//
//  Created by Mikhail Demichev on 13.03.2024.
//

import SwiftUI

protocol ExpendableItems: ObservableObject {
    associatedtype Item: Expendable
    var items: [Item] { get set }
    
    func saveItems()
    func addItem()
    func loadItems()
    func removeItems(at offsets: IndexSet)
  
    
}
class Expenses: ExpendableItems {
    typealias Item = ExpenseItem
    
    @Published var items = [Item]()
    @Published var item: Item
    
    
    init() {
        item = ExpenseItem(name: "", type: "Personal", amount: 0.0)
    }
    func addItem() {
        let item = ExpenseItem(name: item.name, type: item.type, amount: item.amount)
        items.insert(item, at: 0)
    }
    func clearItem() {
        item = ExpenseItem(name: "", type: "Personal", amount: 0.0)
    }
    func imageName(for itemType: String) -> String {
           switch itemType {
                case "Personal": return "man"
                case "Buisnes": return "suitcase"
                case "House services": return "house1"
                case "Groceries": return "groceries"
                default: return "questionmark"
           }
       }
}

extension ExpendableItems {
    func saveItems() {
        if let encoded = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
            
    }
    func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Item].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
  
    
}
