//
//  Task.swift
//  calendarApp
//
//  Created by Krisha Avula on 4/20/24.
//

import SwiftUI
import Foundation

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
    
    @Published var tasks: [Task] = [] {
            didSet {
                saveTasks()
            }
        }
        
    private let tasksKey = "SavedTasks"
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    init() {
            loadTasks() // Call loadTasks in the initializer
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    func getDescription(forDay day: Int) -> String? {
        return tasks.first(where: { $0.day == day })?.taskDescription
    }
    
    private func saveTasks() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(tasks)
            UserDefaults.standard.set(data, forKey: tasksKey)
        } catch {
            print("Error saving tasks: \(error.localizedDescription)")
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: tasksKey) {
            do {
                let decoder = JSONDecoder()
                let loadedTasks = try decoder.decode([Task].self, from: data)
                tasks = loadedTasks
                } catch {
                    print("Error loading tasks: \(error.localizedDescription)")
                }
            }
        }
}


