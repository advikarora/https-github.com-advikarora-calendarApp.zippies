// CalendarGrid.swift
import SwiftUI

struct CalendarGrid: View {
    @Binding var currentMonth: Date

    // Store the number of days in the month and the start day index
    @State private var daysInMonth: Int = 0
    @State private var firstDayOfMonth: Date = Date()
    
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
                    Text("\(day + 1)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                }
            }
        }
        .onAppear(perform: updateMonthData)
        .onChange(of: currentMonth, perform: { _ in updateMonthData() })
    }
}

struct CalendarGrid_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGrid(currentMonth: .constant(Date()))
    }
}
