//
//  CoreDataSample_NEWApp.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import SwiftUI

@main
struct CoreDataSample_NEWApp: App {
	
	@StateObject var contentViewModel: ContentViewModel = ContentViewModel(dataManager: CoreDataManager(), logsManager: LogsViewModel())
	
	var body: some Scene {
		WindowGroup {
			ContentView(contentViewModel)
		}
	}
}
