//
//  CalendarioView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct CalendarioView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("calendario")
                }
                Divider()
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Calendario").toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        withAnimation{
                            self.showSidebar.toggle()
                        }
                    } label:{
                        Label("menu", systemImage: "line.3.horizontal")
                    }
                }
            }
        }
    }
}

struct CalendarioView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarioView(showSidebar: .constant(false))
    }
}
