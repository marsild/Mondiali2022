//
//  ConvocatiSquadraView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 21/07/22.
//

import SwiftUI

struct ConvocatiSquadraView: View {
     let ruoli : Dictionary<String, String> = ["P": "Portieri",
     "D": "Difensori",
     "C": "Centrocampisti",
     "A": "Attaccanti"]
    let giocatori: [Giocatore]
    var body: some View {
        VStack{
            Divider()
            ForEach(ruoli.sorted(by: >), id: \.key) { key, value in
                DisclosureGroup{
                    VStack{
                        ForEach(giocatori){ giocatore in
                            if giocatore.ruolo == key {
                                Divider()
                                HStack{
                                    Text(giocatore.nome)
                                        .font(.callout)
                                    Spacer()
                                }
                            }
                        }
                    }.padding(.top, 5)
                    
                } label: {
                    Text(value)
                }
                .padding(.horizontal)
                Divider()
            }
        }
    }
}

struct ConvocatiSquadraView_Previews: PreviewProvider {
    static var previews: some View {
        ConvocatiSquadraView(giocatori: [Giocatore(id: "", idsquadra: "1", nazione: "", ruolo: "P", nome: "Ricardo Kaka"),Giocatore(id: "2", idsquadra: "1", nazione: "", ruolo: "P", nome: "Ricardo Kaka")])
    }
}
