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
    var body: some View {
            TabView(selection: $selectedTab){
                SquadreView().tabItem{
                    Image(systemName: "map")
                    Text("SQUADRE")
                }.tag("One").navigationTitle("Squadre")
                GironiView().tabItem{
                    Image(systemName: "square.grid.2x2")
                    Text("GIRONI")
                }.tag("Two").navigationTitle("Gironi")
                EliminazioneView().tabItem{
                    Image(systemName: "square.and.line.vertical.and.square.filled")
                    Text("ELIMINAZIONE")
                }.tag("Three")
                CalendarioView().tabItem{
                    Image(systemName: "calendar")
                    Text("CALENDARIO")
                }.tag("Four")
            }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: "One")
    }
}
