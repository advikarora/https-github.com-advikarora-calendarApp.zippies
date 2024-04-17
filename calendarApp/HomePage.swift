//
//  HomePage.swift
//  calendarApp
//
//  Created by Advik Arora on 4/16/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 500)
                HStack {
                    
                        NavigationLink(destination: CalendarView()) {
                            Text("Go to Calendar")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        NavigationLink(destination: NotesPage()) {
                            Text("Go to Notes")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
