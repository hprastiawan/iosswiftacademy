//
//  CoreDataHelper.swift
//  ProjectPertama
//
//  Created by Macbook on 20/02/24.
//

import CoreData
import UIKit

enum ProductCoreData {
  case cart(id: Int)
  case favorite(id: Int)
}

enum CoreDataResult {
  case added, failed, deleted, updated
}

class CoreDataHelper {
  static let shared = CoreDataHelper()

  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Snapgram")
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  private var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  private let predicateProductId: String = "productID == %d"
  private let predicateUserId: String = "userID == %@"

  private init() {}

  internal func clearCoreData(entityName: String) {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

    do {
      try context.execute(batchDeleteRequest)
      try context.save()
    } catch {
      print("Error clearing Core Data: \(error)")
    }
  }

  internal func isEntityExist<T: NSManagedObject>(_ entity: T.Type, productId: Int, userId: String) -> Bool {
    do {
      let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entity))
      fetchRequest.predicate = NSPredicate(format: "\(predicateProductId) AND \(predicateUserId)", argumentArray: [productId, userId])
      let isExist = try context.fetch(fetchRequest)
      return !isExist.isEmpty
    } catch {
      print("Error fetching entity data: \(error) ")
      return false
    }
  }

  internal func fetchItems<T: NSManagedObject>(_ entity: T.Type, userId: String) throws -> [T] {
    let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entity))
    fetchRequest.predicate = NSPredicate(format: predicateUserId, userId)
    let item = try context.fetch(fetchRequest)
    return item
  }

  internal func addOrUpdateEntity<T: NSManagedObject>(_ entity: T.Type, for favorite: ProductCoreData, productId: Int, userId: String, properties: [String: Any], isIncrement: Bool) -> CoreDataResult {
    do {
      let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
      fetchRequest.predicate = NSPredicate(format: "\(predicateProductId) AND \(predicateUserId)", argumentArray: [productId, userId])

      let newEntity = T(context: context)
      properties.forEach { key, value in
        newEntity.setValue(value, forKey: key)
      }
      try context.save()
      return .added
    } catch {
      print("Error fetching or adding entity data: \(error)")
      return .failed
    }
  }


  private func deleteFavoriteItem<T: NSManagedObject>(item: T, completion: (() -> Void)? = nil) -> CoreDataResult {
    do {
      context.delete(item)
      try context.save()
      completion?()
      return .deleted
    } catch {
      print("Error Deleting Item: \(error)")
      return .failed
    }
  }
}
