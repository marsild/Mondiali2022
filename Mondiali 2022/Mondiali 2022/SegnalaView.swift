//
//  SegnalaView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct SegnalaView: View {
    @State var home: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("segnala")
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Segnala").toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        withAnimation{
                            AppState.shared.gameID = UUID()
                        }
                    } label:{
                        Label("home", systemImage: "house")
                    }
                }
            }
        }
    }
}

struct SegnalaView_Previews: PreviewProvider {
    static var previews: some View {
        SegnalaView()
    }
}
