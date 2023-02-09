//
//  TransactionEntity+CoreDataProperties.swift
//  BudgetWise
//
//  Created by Osmar Juarez on 08/02/23.
//
//

import Foundation
import CoreData


extension TransactionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionEntity> {
        return NSFetchRequest<TransactionEntity>(entityName: "TransactionEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var value: Float

}

extension TransactionEntity : Identifiable {

}
