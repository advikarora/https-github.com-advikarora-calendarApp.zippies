import SwiftUI
import Combine 

class NoteManager: ObservableObject {
    @Published var notes: [String] = []

    func addNote(_ note: String) {
        let trimmedNote = note.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedNote.isEmpty {
            notes.append(trimmedNote)
        }
    }

    func removeNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}
