//
//  LogsViewModel.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import Foundation

class LogsViewModel: ObservableObject {
	
	@Published var logs: [Date: String] = [:]
	
	var sortedLogs: [(key: Date, value: String)] {
		logs.sorted { $0.key > $1.key }
	}
	
	func log(action: Action, message: String) {
		logs[Date()] = "\(formatDate(Date())) - \(action.rawValue): \(message)"
	}
	
	func formatDate(_ data: Date) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM HH:mm"
		formatter.locale = Locale(identifier: "pt_BR")
		return formatter.string(from: data)
	}
	
	
}

enum Action: String {
	case create
	case delete
	case read
	case update
}
