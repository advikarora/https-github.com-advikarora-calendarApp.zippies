// DateExtensions.swift
import Foundation

extension Date {
    func monthMetadata() throws -> (firstDay: Date, daysCount: Int) {
        guard let monthInterval = Calendar.current.dateInterval(of: .month, for: self) else {
            throw NSError(domain: "CalendarError", code: 100, userInfo: nil)
        }

        let firstDay = monthInterval.start
        let daysCount = Calendar.current.dateComponents([.day], from: firstDay, to: monthInterval.end).day!
        
        return (firstDay, daysCount)
    }

    var numberOfDaysInMonth: Int {
        Calendar.current.range(of: .day, in: .month, for: self)?.count ?? 0
    }

    var firstDayOfMonth: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }

    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }

    func formattedMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }
}
