//
//  AppNav.swift
//  calendarApp
//
//  Created by Grace Odondi on 4/15/24.
//

import SwiftUI

enum Tabs: Int {
    case calendar = 0
    case notes = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack {
            Button{
                //Switch to Calendar
                selectedTab = .calendar
                
            } label: {
                TabBarButton(buttonText: "Calendar", imageName: "calendar", isActive: selectedTab == .calendar)
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Button {
                // Home
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text("New Event")
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Button{
                //Switch to Notes
                selectedTab = .notes
            } label: {
                TabBarButton(buttonText: "Notes", imageName: "note.text", isActive: selectedTab == .notes)
            }
            .foregroundColor(.blue)
            
        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.calendar))
    }
}
