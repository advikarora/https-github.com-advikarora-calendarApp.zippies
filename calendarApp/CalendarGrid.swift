// CalendarGrid.swift
import SwiftUI

struct CalendarGrid: View {
    @Binding var currentMonth: Date

    // Store the number of days in the month and the start day index
    @State private var daysInMonth: Int = 0
    @State private var firstDayOfMonth: Date = Date()
    @State private var isShowingTaskPopup = false
    @State private var selectedDay = 0
    @State private var taskDescription = ""
    
    private var daysOfWeek: [String] {
        ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    }

    // Update the state when currentMonth changes
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
                    Button(action: {
                        selectedDay = day + 1
                        isShowingTaskPopup = true
                    }) {
                        Text("\(day + 1)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(5)
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
                    // Create and save the task for the selected day
                    let newTask = Task(day: selectedDay, taskDescription: taskDescription)
                    // Add code here to save the task to your data model or perform any other necessary action
                    // After adding the task, dismiss the pop-up
                    isShowingTaskPopup = false
                }
                .padding()
            }
            .padding()
        })
    }
}

struct CalendarGrid_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGrid(currentMonth: .constant(Date()))
    }
}
