//
//  AppNav.swift
//  calendarApp
//
//  Created by Grace Odondi on 4/15/24.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack {
            Button{
                //Switch to Calendar
            } label: {
                VStack (alignment: .center, spacing: 4){
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Text("Calendar")
                }
            }
            .tint(Color("blue"))
            
            Button {
                // New Event
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text("New Event")
                }
            }
            .tint(Color("dark blue"))
            
            Button{
                //Switch to Notes
            } label: {
                VStack (alignment: .center, spacing: 4){
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Notes")
                }
            }
            .tint(Color("blue"))
            
        }
        .frame(height: 82)
    }
}
