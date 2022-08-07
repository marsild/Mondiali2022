//
//  SheetView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 24/07/22.
//

import SwiftUI

struct SelectPlayerSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var player : (giocatore: Giocatore, emoji:String)
    var title:String
    @Binding var ListaGiocatori : [Giocatore]
    var squadre: [Squadra]
    @State var giocatoriPerSquadra = [
        "1" : [Giocatore](),"2" : [Giocatore](),"3" : [Giocatore](),"4" : [Giocatore](),
        "5" : [Giocatore](),"6" : [Giocatore](),"7" : [Giocatore](),"8" : [Giocatore](),
        "9" : [Giocatore](),"10" : [Giocatore](),"11" : [Giocatore](),"12" : [Giocatore](),
        "13" : [Giocatore](),"14" : [Giocatore](),"15" : [Giocatore](),"16" : [Giocatore](),
        "17" : [Giocatore](),"18" : [Giocatore](),"19" : [Giocatore](),"20" : [Giocatore](),
        "21" : [Giocatore](),"22" : [Giocatore](),"23" : [Giocatore](),"24" : [Giocatore](),
        "25" : [Giocatore](),"26" : [Giocatore](),"27" : [Giocatore](),"28" : [Giocatore](),
        "29" : [Giocatore](),"30" : [Giocatore](),"31" : [Giocatore](),"32" : [Giocatore]()
    ]
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            List{
                ForEach(squadre.sorted(by: {$0.nome < $1.nome})){ squadra in
                    if searchText.isEmpty || squadra.nome.localizedStandardContains(searchText) {
                        Section(header: Text("\(squadra.nome)")){
                            ForEach(giocatoriPerSquadra[squadra.id]!){ p in
                                let emoji = squadre.first { Squadra in
                                    Squadra.id == p.idsquadra
                                }?.emoji ?? "🏴‍☠️"
                                Button{
                                    if(player.emoji != ""){
                                        ListaGiocatori.append(player.giocatore)
                                    }
                                    ListaGiocatori.removeAll { giocatore in
                                        giocatore.nome == p.nome
                                    }
                                    player.giocatore = p
                                    player.emoji = emoji
                                    dismiss()
                                } label: {
                                    Text("\(p.nome)").foregroundColor(Color(UIColor.label))
                                }
                            }
                        }
                    }
                }
                if (!searchText.isEmpty && !checkitem($searchText)) || searchText.count > 3{
                    ForEach(ListaGiocatori){ p in
                        if p.nome.localizedStandardContains(searchText) {
                            let emoji = squadre.first { Squadra in
                                Squadra.id == p.idsquadra
                            }?.emoji ?? "🏴‍☠️"
                            Button{
                                if(player.emoji != ""){
                                    ListaGiocatori.append(player.giocatore)
                                }
                                ListaGiocatori.removeAll { giocatore in
                                    giocatore.nome == p.nome
                                }
                                player.giocatore = p
                                player.emoji = emoji
                                dismiss()
                            } label: {
                                Text("\(p.nome)").foregroundColor(Color(UIColor.label))
                            }
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle(title).searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)).toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label:{
                        Text("Annulla")
                    }
                }
            }
        }.onAppear{
            for player in ListaGiocatori{
                giocatoriPerSquadra[player.idsquadra]!.append(player)
            }
        }
    }
    func checkitem(_ t: Binding<String>) -> Bool{
        var test = false
        for nomeSquadra in squadre.map({ Squadra in
            Squadra.nome
        }){
            if nomeSquadra.localizedStandardContains(t.wrappedValue){
                test = true
            }
        }
        return test
    }
}
/*
 struct SheetView_Previews: PreviewProvider {
 static var previews: some View {
 SheetView()
 }
 }*/
