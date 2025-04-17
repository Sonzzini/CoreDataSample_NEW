//
//  HirePersonView.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import SwiftUI

struct HirePersonView: View {
	
	let hirePersonViewModel = HirePersonViewModel()
	let contentViewModel: ContentViewModel
	
	@Environment(\.dismiss) var dismiss
	
	@State var personName: String = ""
	@State var personAge: Int = 0
	@State var personContractDate: Date = Date()
	
	var body: some View {
		NavigationStack {
			List {
				HStack {
					Text("Name")
					TextField("insert here", text: $personName)
				}
				
				Picker("Age", selection: $personAge) {
					ForEach(18..<99) { age in
						Text("\(age)")
					}
				}
				
				DatePicker("Contract Date", selection: $personContractDate)
					.datePickerStyle(.graphical)
				
			}
			
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button {
						//
					} label: {
						Text("Hire")
					}
					.disabled(personName != "" ? false : true)
				}
				
				ToolbarItem(placement: .cancellationAction) {
					Button {
						dismiss()
					} label: {
						Text("Exit")
					}
				}
				
				ToolbarItem(placement: .primaryAction) {
					Button {
						// Generates a person's data
						let autoName = hirePersonViewModel.generatePersonName()
						let autoAge = hirePersonViewModel.generatePersonAge()
						let autoDate = hirePersonViewModel.generatePersonContractDate()
						
						// Hires that person
						contentViewModel.hirePerson(name: autoName, age: autoAge, contractDate: autoDate)
						
						dismiss()
					} label: {
						Text("Auto Generate")
					}
				}
			}
			
		}
	}
}

#Preview {
	HirePersonView(contentViewModel: ContentViewModel(
		dataManager: CoreDataManager(),
		logsManager: LogsViewModel())
	)
}
