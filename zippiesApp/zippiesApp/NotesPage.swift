import SwiftUI

struct NotesPage: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView()) {
                    Text("Go to Content View")
                }
                .navigationTitle("Notes Page")
            }
        }
    }
}

struct NotesPage_Preview: PreviewProvider {
    static var previews: some View {
        NotesPage()
    }
}
