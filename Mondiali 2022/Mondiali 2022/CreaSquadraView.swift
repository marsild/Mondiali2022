//
//  CreaSquadraView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct CreaSquadraView: View {
    @State var home: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("crea")
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Crea").toolbar {
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

struct CreaSquadraView_Previews: PreviewProvider {
    static var previews: some View {
        CreaSquadraView()
    }
}
