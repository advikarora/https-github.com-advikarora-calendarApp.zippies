//
//  Task.swift
//  calendarApp
//
//  Created by Krisha Avula on 4/20/24.
//

import SwiftUI

struct Task: Codable, Identifiable {
    let id: UUID
    var day: Int
    var taskDescription: String
    
    init(day: Int, taskDescription: String) {
        self.id = UUID()
        self.day = day
        self.taskDescription = taskDescription
    }
}

class TaskManager: ObservableObject {
    static let shared = TaskManager()
    
    @Published var tasks: [Task] = []
    
    internal init() {}
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func getDescription(forDay day: Int) -> String? {
        return tasks.first(where: { $0.day == day })?.taskDescription
    }
}


