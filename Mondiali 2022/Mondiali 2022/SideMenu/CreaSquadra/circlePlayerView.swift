//
//  circlePlayerView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 24/07/22.
//

import SwiftUI

struct circlePlayerView: View{
    @State private var showingSheet = false
    @Binding var player : (giocatore:Giocatore, emoji:String)
    var title:String
    @Binding var ListaGiocatori : [Giocatore]
    var squadre: [Squadra]
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(.green).opacity(0.8)
                    .frame(maxWidth: 45, maxHeight: 45)
                    .shadow(radius: 10)
                VStack{
                    Text("\(player.emoji)").font(.title).minimumScaleFactor(0.1)
                }
            }
            if(!player.giocatore.nome.isEmpty){
                Text("\(player.giocatore.nome)").minimumScaleFactor(0.1).multilineTextAlignment(.center).padding(5).background(Color.green.opacity(0.8)).cornerRadius(5).foregroundColor(.black)
            }
        }.onTapGesture {
            showingSheet.toggle()
        }.sheet(isPresented: $showingSheet) {
            SelectPlayerSheetView(player: $player, title: title, ListaGiocatori: $ListaGiocatori, squadre: squadre)
        }
    }
}
/*
struct circlePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        circlePlayerView()
    }
}*/
