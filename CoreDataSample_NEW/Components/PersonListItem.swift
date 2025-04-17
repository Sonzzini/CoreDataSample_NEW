//
//  PersonListItem.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import SwiftUI

struct PersonListItem: View {
	
	let person: Person
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text("\(person.name ?? "")")
					.bold()
				Spacer()
				Text("\(person.age)")
			}
			Text("\(person.contractDate ?? Date())")
				.font(.callout)
		}
	}
}
