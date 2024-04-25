// CalendarGrid.swift
import SwiftUI

struct CalendarGrid: View {
    @Binding var currentMonth: Date
    @ObservedObject var taskManager = TaskManager()
    
    
    @State private var daysInMonth: Int = 0
    @State private var firstDayOfMonth: Date = Date()
    @State private var isShowingTaskPopup = false
    @State private var selectedDay = 1
    @State private var taskDescription = ""
    @State private var tasks: [Int] = []
    
    private var daysOfWeek: [String] {
        ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    }
    
    private func updateMonthData() {
        do {
            let metadata = try currentMonth.monthMetadata()
            firstDayOfMonth = metadata.firstDay
            daysInMonth = metadata.daysCount
        } catch {
            print("Failed to calculate month metadata: \(error)")
        }
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(0..<daysInMonth, id: \.self) { day in
                    let description = taskManager.getDescription(forDay: day + 1)
                    Button(action: {
                        DispatchQueue.main.async {
                            selectedDay = day + 1
                            isShowingTaskPopup = true
                        }
                    }) {
                        VStack {
                            Text("\(day + 1)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(5)
                            if description != nil {
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 8, height: 8)
                                    .offset(x: 0, y: 3)
                            }
                        }
                    }
                }
            }
            .onAppear(perform: updateMonthData)
            .onChange(of: currentMonth, perform: { _ in updateMonthData() })
            
            .popover(isPresented: $isShowingTaskPopup, content: {
                VStack {
                    Text("Add Task for Day \(selectedDay)")
                        .font(.headline)
                        .padding()
                    TextField("Task Description", text: $taskDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Add Task") {
                        let newTask = Task(day: selectedDay, taskDescription: taskDescription)
                        taskManager.addTask(newTask)
                        tasks.append(selectedDay)
                        isShowingTaskPopup = false
                    }
                    .padding()
                }
                .padding()
                .onAppear {
                    self.selectedDay = selectedDay
                    taskDescription = ""
                }
                })
                
            List {
                ForEach(taskManager.tasks) { task in
                    HStack {
                        Text("\(task.day): \(task.taskDescription)")
                        Spacer()
                        Button(action: {
                            taskManager.removeTask(task)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
    
    struct CalendarGrid_Previews: PreviewProvider {
        static var previews: some View {
            CalendarGrid(currentMonth: .constant(Date()))
        }
    }
}
