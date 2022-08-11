//
//  PartitaEliminazioneView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 11/08/22.
//

import SwiftUI

struct PartitaEliminazioneView: View {
    @ObservedObject var model: ViewModel
    var squadra1: Squadra
    var squadra2: Squadra
    @Binding var squadraSelected : Squadra
    var body: some View {
        HStack(spacing:0){
            if(squadra1.id != "100"){
                VStack(spacing:0){
                    ZStack{
                        if(squadra1.id == squadraSelected.id){
                            Circle().foregroundColor(Color(UIColor.quaternaryLabel))
                        } else {
                            Circle().foregroundColor(Color(UIColor.systemBackground))
                        }
                        Text(squadra1.emoji).padding(5).minimumScaleFactor(0.1)
                    }.onTapGesture {
                        if(squadraSelected.id == squadra1.id){
                            squadraSelected.id = "100"
                        } else {
                            squadraSelected = squadra1
                        }
                    }
                    Text(squadra1.nome.prefix(3).uppercased()).font(.footnote).minimumScaleFactor(0.1)
                }
            } else {
                Spacer()
            }
            Text("-")
            if(squadra2.id != "100"){
                VStack(spacing:0){
                    ZStack{
                        if(squadra2.id == squadraSelected.id){
                            Circle().foregroundColor(Color(UIColor.quaternaryLabel))
                        } else {
                            Circle().foregroundColor(Color(UIColor.systemBackground))
                        }
                        Text(squadra2.emoji).padding(5).minimumScaleFactor(0.1)
                    }.onTapGesture {
                        if(squadraSelected.id == squadra2.id){
                            squadraSelected.id = "100"
                        } else {
                            squadraSelected = squadra2
                        }
                    }
                    Text(squadra2.nome.prefix(3).uppercased()).font(.footnote).minimumScaleFactor(0.1)
                }
            } else {
                Spacer()
            }
        }.frame(width:UIScreen.main.bounds.size.width*1/5).frame(height: 45)
    }
}

struct PartitaEliminazioneView_Previews: PreviewProvider {
    static var previews: some View {
        PartitaEliminazioneView(model: ViewModel(), squadra1: Squadra(id: "1", nome: "Qatar", emoji: "🇦🇱", descrizione: "bla", gruppo: 1, latitudine: 0.0, longitudine: 0.0), squadra2: Squadra(id: "2", nome: "Ecuador", emoji: "🇧🇷", descrizione: "bla", gruppo: 1, latitudine: 0.0, longitudine: 0.0), squadraSelected: .constant(Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 1, latitudine: 0.1, longitudine: 0.1)))
    }
}
