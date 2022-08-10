//
//  PrediciFuturoView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct PrediciFuturoView: View {
    @ObservedObject var model: ViewModel
    @Environment(\.verticalSizeClass) var sizeClass
    @State var squadra1 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra2 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra3 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra4 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra5 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra6 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra7 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra8 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra9 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra10 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra11 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra12 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra13 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra14 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra15 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra16 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    var body: some View {
        NavigationView{
            ScrollView{
            HStack{
                VStack{
                    SingoloGironePrediciView(model: model, squadra1: $squadra1, squadra2: $squadra2, gruppo: 1)
                    SingoloGironePrediciView(model: model, squadra1: $squadra3, squadra2: $squadra4, gruppo: 2)
                    SingoloGironePrediciView(model: model, squadra1: $squadra5, squadra2: $squadra6, gruppo: 3)
                    SingoloGironePrediciView(model: model, squadra1: $squadra7, squadra2: $squadra8, gruppo: 4)
                }.frame(width:UIScreen.main.bounds.size.width*2/5)
                VStack{
                    Text("OTTAVI")
                    //squadra1 vs squadra4
                    //squadra5 vs squadra8
                    //squadra3 vs squadra2
                    //squadra7 vs squadra6
                    //squadra9 vs squadra12
                    //squadra13 vs squadra16
                    //squadra11 vs squadra10
                    //squadra15 vs squadra14
                    Text("QUARTI")
                    Text("SEMI")
                    Text("3°/4°")
                    Text("FINALE")
                }.frame(width:UIScreen.main.bounds.size.width*1/5)
                VStack{
                    SingoloGironePrediciView(model: model, squadra1: $squadra9, squadra2: $squadra10, gruppo: 5)
                    SingoloGironePrediciView(model: model, squadra1: $squadra11, squadra2: $squadra12, gruppo: 6)
                    SingoloGironePrediciView(model: model, squadra1: $squadra13, squadra2: $squadra14, gruppo: 7)
                    SingoloGironePrediciView(model: model, squadra1: $squadra15, squadra2: $squadra16, gruppo: 8)
                }.frame(width:UIScreen.main.bounds.size.width*2/5)
            }.padding(.top)}.padding(.vertical).navigationBarTitleDisplayMode(.inline).navigationTitle("Predici il futuro").toolbar {
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
        PrediciFuturoView(model: ViewModel())
    }
}
