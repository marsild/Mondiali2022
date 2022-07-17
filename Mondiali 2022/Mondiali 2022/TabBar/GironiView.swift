//
//  GironiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct GironiView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("gironi")
                }
                Divider()
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Gironi").toolbar {
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

struct GironiView_Previews: PreviewProvider {
    static var previews: some View {
        GironiView(showSidebar: .constant(false))
    }
}
