//
//  HirePersonViewModel.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import Foundation
import SwiftUI

class HirePersonViewModel {
	
	func generatePersonName() -> String {
		let firstNames = ["James", "Mary", "Robert", "Patricia", "John", "Jennifer", "Michael", "Linda", "William", "Elizabeth", "David", "Barbara", "Richard", "Susan", "Joseph", "Jessica"]
		let lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas", "Taylor"]
		
		let firstName = firstNames.randomElement() ?? "First"
		let lastName = lastNames.randomElement() ?? "Last"
		
		return "\(firstName) \(lastName)"
	}
	
	func generatePersonAge() -> Int {
		Int.random(in: 18...100)
	}
	
	func generatePersonContractDate() -> Date {
		Date(timeIntervalSinceNow: -Double(Int.random(in: 0...31536000)))
	}
}
