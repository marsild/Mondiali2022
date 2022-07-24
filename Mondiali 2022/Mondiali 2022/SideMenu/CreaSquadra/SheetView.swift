//
//  SheetView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 24/07/22.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var player : (name:String, emoji:String)
    var title:String
    @Binding var ListaGiocatori : [Giocatore]

    var squadre: [Squadra]
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(ListaGiocatori){ p in
                        let emoji = squadre.first { Squadra in
                            Squadra.id == p.idsquadra
                        }?.emoji ?? "🏴‍☠️"
                        if searchText.isEmpty || (p.nome.contains(searchText) || p.nazione.contains(searchText)) {
                            HStack(alignment: .center){
                                    Text("\(p.nome)").frame(maxWidth: UIScreen.main.bounds.size.width/2, alignment: .leading)
                                    Text("\(p.nazione)").frame(maxWidth: UIScreen.main.bounds.size.width/2, alignment: .trailing)
                            }.frame(maxWidth: UIScreen.main.bounds.size.width).padding(.horizontal).onTapGesture {
                                ListaGiocatori.removeAll { giocatore in
                                    giocatore.nome == p.nome
                                }
                                player.name = p.nome
                                player.emoji = emoji
                                dismiss()
                            }
                        }
                        
                        if searchText.isEmpty {
                            Divider()
                        }
                        else {
                            if(p.nome.contains(searchText) || p.nazione.contains(searchText)){
                                Divider()
                            }
                        }
                    }
                }.searchable(text: $searchText).padding(.top)
            }.navigationBarTitleDisplayMode(.inline).navigationTitle(title)
        }
    }
}
/*
struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}*/
