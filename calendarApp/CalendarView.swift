// CalendarView.swift
import SwiftUI

struct CalendarView: View {
    @State private var currentMonth = Date()

    var body: some View {
        VStack {
            Text("Calendar Page")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack {
                Button(action: {
                    currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth)!
                }) {
                    Text("Previous")
                }

                Spacer()

                Text(currentMonth.formattedMonth())
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()

                Button(action: {
                    currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth)!
                }) {
                    Text("Next")
                }
            }
            .padding()

            CalendarGrid(currentMonth: $currentMonth)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
