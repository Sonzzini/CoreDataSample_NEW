//
//  LogsView.swift
//  CoreDataSample_NEW
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/04/25.
//

import Foundation
import SwiftUI

struct LogsView: View {
	
	@ObservedObject var logsViewModel: LogsViewModel
	
	var body: some View {
		List(logsViewModel.sortedLogs, id: \.key) { log in
			VStack {
				Text("\(log.value)")
			}
		}
	}
}
