//
//  TransactionViewModel.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 08/02/23.
//

import Foundation
import CoreData
import UIKit

class TransactionViewModel: ObservableObject {
    
    @Published var transactions : [TransactionEntity] = []
    private var context : NSManagedObjectContext
    private var transaction : TransactionEntity?
    @Published var balance: Float = 0.0
    @Published var signedBalance: String = ""
    @Published var incomes: Float = 1.0
    @Published var expenses: Float = 1.0
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    init() {
        self.context = (UIApplication.shared.delegate! as! AppDelegate).persistentContainer.viewContext
        let container = NSPersistentContainer(name: "TransactionContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error{
                print("[ERROR] Could not load core data \(error)")
            } else{
                print("[Success] Core data loaded")
            }
        }
    }
    
    func fetch() {
        do{
            self.transactions = try self.context.fetch(TransactionEntity.fetchRequest())
        } catch {
            print("[ERROR] Fetching data fail \(error)")
        }
    }
    
    func saveTransaction(tType: String, tName: String, tValue: Float) -> Bool {
        var flagSaved = false
        transaction = TransactionEntity(context: context)
        transaction?.id_transaction = UUID()
        transaction?.type = tType
        transaction?.name = tName
        transaction?.value = tValue
        
        do{
            try context.save()
            flagSaved = true
        }
        catch{
            print("error al salvar",error)
        }
        return flagSaved
    }
    
    func getTransaction(index: Int) -> TransactionEntity{
        return transactions[index]
    }
    
    func countTransactions() -> Int{
        return transactions.isEmpty ? 0 : transactions.count
    }
    
    func updateDashboardData() {
        var totalIncomes: Float = 0.0
        var totalExpenses: Float = 0.0
        let transactionsSize: Int = countTransactions()
        
        if transactionsSize != 0 {
            for i in 0...transactionsSize-1 {
                let transaction = getTransaction(index: i)
                if transaction.type == "income" {
                    totalIncomes = totalIncomes + transaction.value
                } else {
                    totalExpenses = totalExpenses + transaction.value
                }
            }
        }
        
        if totalIncomes>totalExpenses {
            self.balance = totalIncomes-totalExpenses
            self.signedBalance = ""
        } else if totalExpenses>totalIncomes{
            self.balance = totalExpenses-totalIncomes
            self.signedBalance = "-"
        }else if totalIncomes.isZero && totalExpenses.isZero {
            self.incomes = 10.0
            self.expenses = 10.0
            self.signedBalance = ""
        }
        
        self.expenses =  totalExpenses
        self.incomes =  totalIncomes
    }
}
