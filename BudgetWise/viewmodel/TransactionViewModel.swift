//
//  TransactionViewModel.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 08/02/23.
//

import Foundation
import CoreData

class TransactionViewModel {
    
    private var transactions : [TransactionEntity] = []
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func fetch() {
        do{
            self.transactions = try self.context.fetch(TransactionEntity.fetchRequest())
        } catch {
            print("[ERROR] Fetching data fail \(error)")
        }
    }
    
    func getTask(index: Int) -> TransactionEntity{
        return transactions[index]
    }
    
    func countTransactions() -> Int{
        return transactions.count
    }
    
}
