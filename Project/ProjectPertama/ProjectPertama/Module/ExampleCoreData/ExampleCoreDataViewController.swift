//
//  ExampleCoreDataViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 17/03/24.
//

import UIKit
import CoreData

class ExampleCoreDataViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup() {

    // referensi ke AppDelegate
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

    // managed context
    let managedObjectContext = appDelegate.persistentContainer.viewContext
    // Create a new book
    let newBook = Book(context: managedObjectContext)
    newBook.title = "The Hitchhiker's Guide to the Galaxy"

    // Create a new author
    let newAuthor = Author(context: managedObjectContext)
    newAuthor.firstName = "Douglas"
    newAuthor.lastName = "Adams"

    // Assign the author to the book (one-to-many relationship)
    newBook.author = newAuthor

    // Save changes to Core Data
    do {
      try managedObjectContext.save()
    } catch {
      // Handle error
    }

    // Fetch books by author
    let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "author.lastName = %@", "Adams") // Filter by author's last name

    do {
      let fetchedBooks = try managedObjectContext.fetch(fetchRequest)
      for book in fetchedBooks {
        print(book.title!) 
        print(book.author!)// Access the book's title
      }
    } catch {
      // Handle error
    }
  }




}
