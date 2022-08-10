//
//  SingoloGironePrediciView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 10/08/22.
//

import SwiftUI

struct SingoloGironePrediciView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var model: ViewModel
    @Binding var squadra1 : Squadra
    @Binding var squadra2 : Squadra
    var gruppo: Int8
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 2/3)
            VStack(spacing:0){
                Text("Gruppo \(model.gironi[gruppo]!)").font(.footnote).fontWeight(.bold).minimumScaleFactor(0.1).padding(.vertical, 5)
                Divider()
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(model.squadreInGruppo(gruppo: gruppo)){ squadra in
                        VStack(spacing:0){
                            ZStack{
                                if(squadra1.id == squadra.id || squadra2.id == squadra.id){
                                    Circle().foregroundColor(Color(UIColor.quaternaryLabel))
                                } else {
                                    Circle().foregroundColor(Color(UIColor.systemBackground))
                                }
                                Text(squadra.emoji).padding(5).minimumScaleFactor(0.1)
                        }
                            Text(squadra.nome.prefix(3).uppercased()).font(.footnote).minimumScaleFactor(0.1)}.onTapGesture {
                            if(squadra1.id != squadra.id && squadra2.id != squadra.id ){
                                if(squadra1.id == "100"){
                                    squadra1 = squadra
                                } else if (squadra2.id == "100"){
                                    squadra2 = squadra
                                }/* else {
                                    squadra1 = squadra2
                                    squadra2 = squadra
                                }*/
                            }
                            else {
                                if(squadra1.id == squadra.id){
                                    squadra1.id = "100"
                                } else {
                                    squadra2.id = "100"
                                }
                            }
                        }
                    }
                }.padding(5)
            }
        }.frame(maxWidth:UIScreen.main.bounds.size.width*2/5).padding(.horizontal)
    }
}

struct SingoloGironePrediciView_Previews: PreviewProvider {
    static var previews: some View {
        SingoloGironePrediciView(model: ViewModel(), squadra1: .constant(Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 1, latitudine: 0.1, longitudine: 0.1)), squadra2: .constant(Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 1, latitudine: 0.1, longitudine: 0.1)), gruppo: 1)
    }
}
