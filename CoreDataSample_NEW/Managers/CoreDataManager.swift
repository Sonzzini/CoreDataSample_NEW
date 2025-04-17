//
//  CoreDataManager.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataManager {
		
	// Where the data is saved
	let persistentContainer: NSPersistentContainer
	
	// The data's context
	var viewContext: NSManagedObjectContext {
		return persistentContainer.viewContext
	}
	
	init(){
		persistentContainer = NSPersistentContainer(name: "Models")
		
		persistentContainer.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
		}
	}
	
	func createPerson(name: String, age: Int, contractDate: Date) -> Result<Person, Error> {
		let person = Person(context: self.viewContext)
		person.name = name
		person.age = Int16(age)
		person.contractDate = contractDate
		
		do {
			try self.viewContext.save()
			return .success(person)
		} catch {
			return .failure(error)
		}
	}
	
	func deletePerson(_ person: Person) -> Result<Void, Error> {
		
		do {
			viewContext.delete(person)
			try viewContext.save()
			return .success(())
		} catch {
			return .failure(error)
		}
		
	}
	
	func fetchAllPersons() -> Result<[Person], Error> {
		let request: NSFetchRequest<Person> = Person.fetchRequest()
		
		do {
			let result: [Person] = try self.viewContext.fetch(request)
			return .success(result)
		} catch {
			return .failure(error)
		}
	}
	
	func updatePersonAge(_ person: Person, newAge: Int) -> Result<Void, Error> {
		
		do {
			person.age = Int16(newAge)
			try viewContext.save()
			return .success(())
		} catch {
			return .failure(error)
		}
	}

}
