import SwiftUI

struct NotesPage: View {
    @State private var noteText: String = ""
    @EnvironmentObject var noteManager: NoteManager // Use EnvironmentObject here
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $noteText)
                    .frame(height: 300)
                    .padding()
                    .border(Color.gray, width: 1)
                
                Button(action: {
                    noteManager.addNote(noteText)
                    noteText = ""
                }) {
                    Text("Save Note")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding(.top, 20)
                
                List {
                    ForEach(noteManager.notes.indices, id: \.self) { index in
                        NavigationLink(destination: NoteDetailView(noteText: $noteManager.notes[index])) {
                            Text(noteManager.notes[index])
                        }
                    }
                    .onDelete(perform: noteManager.removeNotes)
                }
            }
            .navigationTitle("Notes")
            .padding(.horizontal)
        }
    }
}

struct NotesPage_Preview: PreviewProvider {
    static var previews: some View {
        NotesPage().environmentObject(NoteManager())
    }
}
