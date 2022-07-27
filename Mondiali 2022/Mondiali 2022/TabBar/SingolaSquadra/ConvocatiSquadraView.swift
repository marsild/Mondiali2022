//
//  ConvocatiSquadraView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 21/07/22.
//

import SwiftUI

struct ConvocatiSquadraView: View {
     let ruoli : Dictionary<String, String> = ["P": "PORTIERI",
     "D": "DIFENSORI",
     "C": "CENTROCAMPISTI",
     "A": "ATTACCANTI"]
    let giocatori: [Giocatore]
    var body: some View {
        VStack{
            ForEach(ruoli.sorted(by: >), id: \.key) { key, value in
                Text(value).font(.caption).frame(maxWidth: UIScreen.main.bounds.size.width ,alignment: .leading).padding(.top).padding(.leading, 20)
                    VStack{
                        Divider().foregroundColor(Color(UIColor.label)).opacity(0.1).padding(.bottom,5)
                        ForEach(giocatori){ giocatore in
                            if giocatore.ruolo == key {
                                HStack{
                                    Text(giocatore.nome)
                                        .font(.callout)
                                    Spacer()
                                }.padding(.horizontal)
                                Divider().foregroundColor(Color(UIColor.label)).opacity(0.07)
                            }
                        }
                    }.frame(maxWidth: UIScreen.main.bounds.size.width).background(Color(UIColor.label).opacity(0.1)).cornerRadius(10).padding(.horizontal)
            }
        }
    }
}

struct ConvocatiSquadraView_Previews: PreviewProvider {
    static var previews: some View {
        ConvocatiSquadraView(giocatori: [Giocatore(id: "", idsquadra: "1", nazione: "", ruolo: "P", nome: "Ricardo Kaka"),Giocatore(id: "2", idsquadra: "1", nazione: "", ruolo: "P", nome: "Ricardo Kaka")])
    }
}
