//
//  Task.swift
//  calendarApp
//
//  Created by Krisha Avula on 4/20/24.
//

import SwiftUI

struct Task: Codable {
    let id = UUID()
    var day: Int
    var taskDescription: String
}

class TaskManager: ObservableObject {
    @Published var tasks: [Int: String] = [:] // Dictionary to store tasks (day: description)
    
    func addTask(day: Int, description: String) {
        tasks[day] = description
    }
    
    func getDescription(forDay day: Int) -> String? {
        return tasks[day]
    }
}
