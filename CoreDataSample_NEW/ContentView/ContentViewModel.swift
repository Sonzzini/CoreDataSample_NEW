//
//  ContentViewModel.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
	
	let dataManager: CoreDataManager
	let logManager: LogsViewModel
	
	@Published var persons: [Person] = []
	var completionMessage: String?
	
	init(dataManager: CoreDataManager, logsManager: LogsViewModel) {
		self.dataManager = dataManager
		self.logManager = logsManager
	}
	
	// MARK: Create
	func hirePerson(name: String, age: Int, contractDate: Date) {
		let result = dataManager.createPerson(name: name, age: age, contractDate: contractDate)
		
		switch result {
		case .success(let person):
			persons.append(person)
			completionMessage = "\(person.name ?? "Unknown name") hired successfully!"
			documentAction(action: .create, message: completionMessage!)
		case .failure(let failure):
			completionMessage = "Error hiring person: \(failure)"
			documentAction(action: .create, message: completionMessage!)
		}
		
	}
	
	// MARK: Delete
	func firePerson(_ person: Person) {
		let result = dataManager.deletePerson(person)
		
		switch result {
		case .success:
			let personName = person.name ?? "Unknown name" // For logging
			persons.removeAll { $0.objectID == person.objectID }
			completionMessage = "\(personName) fired successfully!"
			documentAction(action: .delete, message: completionMessage!)
		case .failure(let failure):
			completionMessage = "Error firing \(person.name ?? "Unknown name"): \(failure)"
			documentAction(action: .delete, message: completionMessage!)
		}
	}
	
	// MARK: Read
	func getAllPersons() {
		let result = dataManager.fetchAllPersons()
		
		switch result {
		case .success(let persons):
			self.persons = persons
			documentAction(action: .read, message: "Fetched all persons (\(persons.count)) successfully!")
		case .failure(let failure):
			completionMessage = "Error fetching persons: \(failure)"
			documentAction(action: .read, message: completionMessage!)
		}
	}
	
	// MARK: Update
	func updatePersonAge(_ person: Person, newAge: Int) {
		let result = dataManager.updatePersonAge(person, newAge: newAge)
		
		switch result {
		case .success():
			completionMessage = "\(person.name ?? "Unknown name") age updated successfully to \(newAge)!"
			documentAction(action: .update, message: completionMessage!)
		case .failure(let failure):
			completionMessage = "Error updating person age: \(failure)"
			documentAction(action: .update, message: completionMessage!)
		}
		
		
	}
	
	func documentAction(action: Action, message: String) {
		logManager.log(action: action, message: message)
	}
	
}
