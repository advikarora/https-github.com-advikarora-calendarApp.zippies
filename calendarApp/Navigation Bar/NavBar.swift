//
//  NavBar.swift
//  calendarApp
//
//  Created by Grace Odondi on 4/4/24.
//

import SwiftUI

    struct NavBar: View {
        var body: some View {
            NavigationView {
                VStack {
                    NavigationLink(destination: NotesPage()) {
                        Text("Go to Notes Page")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .navigationTitle("Home")
            }
        }
    }

    struct NotesPage: View {
        var body: some View {
            Text("This is the Notes Page")
                .navigationTitle("Notes")
        }
    }

    struct NavBar_Preview: PreviewProvider {
        static var previews: some View {
            NavBar()
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
}
