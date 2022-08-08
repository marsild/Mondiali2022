//
//  EliminazioneView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct EliminazioneView: View {
    @Binding var showSidebar: Bool
    @ObservedObject var model: ViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                Text("eliminazione")
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Eliminazione").toolbar {
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

struct EliminazioneView_Previews: PreviewProvider {
    static var previews: some View {
        EliminazioneView(showSidebar: .constant(false), model: ViewModel())
    }
}
