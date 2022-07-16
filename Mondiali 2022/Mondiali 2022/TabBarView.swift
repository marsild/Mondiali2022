//
//  SquadreView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct TabBarView: View {
    @Environment(\.verticalSizeClass) var sizeClass
    @State var selectedTab: String
    @State var showSidebar: Bool = false
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $selectedTab){
                SquadreView(showSidebar: $showSidebar).tabItem{
                    Image(systemName: "map")
                    Text("SQUADRE")
                }.tag("One")
                GironiView(showSidebar: $showSidebar).tabItem{
                    Image(systemName: "square.grid.2x2")
                    Text("GIRONI")
                }.tag("Two")
                EliminazioneView(showSidebar: $showSidebar).tabItem{
                    Image(systemName: "square.and.line.vertical.and.square.filled")
                    Text("ELIMINAZIONE")
                }.tag("Three")
                CalendarioView(showSidebar: $showSidebar).tabItem{
                    Image(systemName: "calendar")
                    Text("CALENDARIO")
                }.tag("Four")
            }.frame(width: geometry.size.width, height: geometry.size.height).offset(x: self.showSidebar ? geometry.size.width : 0)
                .disabled(self.showSidebar ? true : false)
            if self.showSidebar {
                SideMenuView(showSidebar: $showSidebar)
                    .frame(width: geometry.size.width)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: "One")
    }
}
