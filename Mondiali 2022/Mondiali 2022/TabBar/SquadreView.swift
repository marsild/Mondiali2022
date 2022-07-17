//
//  GruppiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct SquadreView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        
            
            NavigationView {
                VStack{
                    Divider()
                    ScrollView{
                        Text("squadre")
                    }
                    Divider()
                }.navigationBarTitleDisplayMode(.inline).navigationTitle("Squadre")
                    .toolbar {
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

struct SquadreView_Previews: PreviewProvider {
    static var previews: some View {
        SquadreView(showSidebar: .constant(false))
    }
}
