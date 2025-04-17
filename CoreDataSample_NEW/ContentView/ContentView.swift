//
//  ContentView.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var contentViewModel: ContentViewModel
	
	@State var hireSheetIsPresented: Bool = false
	
	init(_ contentViewModel: ContentViewModel) {
		self.contentViewModel = contentViewModel
	}
	
	var body: some View {
		NavigationStack {
			
			NavigationLink {
				LogsView(logsViewModel: contentViewModel.logManager)
			} label: {
				Text("Show Logs")
			}
			
			List(contentViewModel.persons) { person in
				PersonListItem(person: person)
					.swipeActions {
						Button(role: .destructive) {
							contentViewModel.firePerson(person)
						} label: {
							Image(systemName: "trash")
						}
					}
			}
			
			.navigationTitle("Company People")
			
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button {
						hireSheetIsPresented.toggle()
					} label: {
						Image(systemName: "plus.circle.fill")
					}
				}
			}
			
			.sheet(isPresented: $hireSheetIsPresented) {
				HirePersonView(contentViewModel: contentViewModel)
					.presentationDetents([.large])
			}
		}
		.onAppear {
			contentViewModel.getAllPersons()
		}
	}
}

#Preview {
	ContentView(ContentViewModel(
		dataManager: CoreDataManager(),
		logsManager: LogsViewModel())
	)
}
