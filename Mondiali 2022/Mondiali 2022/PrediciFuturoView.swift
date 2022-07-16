//
//  PrediciFuturoView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct PrediciFuturoView: View {
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("predici")
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Predici").toolbar {
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

struct PrediciFuturoView_Previews: PreviewProvider {
    static var previews: some View {
        PrediciFuturoView()
    }
}
