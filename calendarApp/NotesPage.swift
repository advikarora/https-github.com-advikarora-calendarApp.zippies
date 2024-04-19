import SwiftUI

struct NotesPage: View {
    @State private var noteText: String = ""
    @State var selectedTab: Tabs = .notes


    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $noteText)
                    .padding()
                    .border(Color.gray, width: 1)
                NavigationLink(destination: ContentView()) {
                    Text("Go to Content View")
                }
            }
            .navigationTitle("Notes")
        }
    }
}

struct NotesPage_Preview: PreviewProvider {
    static var previews: some View {
        NotesPage()
    }
}
