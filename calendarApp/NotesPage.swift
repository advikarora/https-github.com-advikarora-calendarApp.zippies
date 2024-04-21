import SwiftUI

struct NotesPage: View {
    @State private var noteText: String = ""
    @State private var notes: [String] = []
    @State var selectedTab: Tabs = .notes


    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $noteText)
                    .frame(height: 300)
                    .padding()
                    .border(Color.gray, width: 1)
                
                Button(action: takeNote) {
                    Text("Save Note")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding(.top, 20)
                
                List {
                    ForEach(notes.indices, id: \.self) { index in
                        NavigationLink(destination: NoteDetailView(noteText: $notes[index])) {
                            Text(notes[index])
                        }
                    }
                    .onDelete(perform: deleteNote)
                }
            }
            .navigationTitle("Notes")
            .padding(.horizontal)
        }
    }
    
    func takeNote() {
        if !noteText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            notes.append(noteText)
            noteText = ""
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

struct NotesPage_Preview: PreviewProvider {
    static var previews: some View {
        NotesPage()
    }
}
