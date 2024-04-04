import SwiftUI

struct NoteDetailView: View {
    @Binding var noteText: String

    var body: some View {
        TextEditor(text: $noteText)
            .padding()
            .navigationBarTitle("Edit Note", displayMode: .inline)
    }
}
