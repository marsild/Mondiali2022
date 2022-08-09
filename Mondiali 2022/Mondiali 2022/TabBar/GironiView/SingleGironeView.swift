//
//  SingleGironeView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 20/07/22.
//

import SwiftUI

struct SingleGironeView: View {
    var girone:String
    var gruppo:Int8
    @ObservedObject var model: ViewModel
    var body: some View {
        
        let squadre:[Squadra] = model.squadreInGruppo(gruppo: gruppo)
        ZStack{
            RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 2/3)
            VStack(alignment: .center){
                Text("Gruppo \(girone)")
                VStack(alignment: .leading){
                    ForEach(squadre){ squadra in
                        Divider()
                        NavigationLink(destination: SingolaSquadraView(latitudine: squadra.latitudine, longitudine: squadra.longitudine, emoji: squadra.emoji, nome: squadra.nome, descrizione: squadra.descrizione, id: squadra.id, model: model)){
                            HStack{
                                Text("\(squadra.emoji)")
                                    .padding(.horizontal)
                                Text("\(squadra.nome)")
                            }
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        
    }
}
/*
struct SingleGironeView_Previews: PreviewProvider {
    static var previews: some View {
        SingleGironeView(girone: "a", squadre: [Squadra(id: "0", nome: "a", emoji: "c", descrizione: "", gruppo: 1, latitudine: 1.1, longitudine: 1.1)])
    }
}*/
