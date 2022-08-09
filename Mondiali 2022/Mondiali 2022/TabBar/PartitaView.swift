//
//  PartitaView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 09/08/22.
//

import SwiftUI

struct PartitaView: View {
    @ObservedObject var model: ViewModel
    var partita: Partita
    @State var bellFilled = false
    var formatter = DateFormatter()
    init(model: ViewModel, partita: Partita){
        self.model = model
        self.partita = partita
        formatter.locale = Locale(identifier: "it")
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
    }
    var body: some View {
        ScrollView{
            Divider()
            if(Int(partita.id)! < 49){
                Text("Fase a gironi")
            } else if(Int(partita.id)! < 57) {
                Text("Ottavi di finale")
            } else if(Int(partita.id)! < 61){
                Text("Quarti di finale")
            } else if(Int(partita.id)! < 63){
                Text("Semifinali")
            } else if(partita.id == "63"){
                Text("Finale 3°/4° posto")
            } else {
                Text("Finale")
            }
            Divider()
            if(partita.casa != "" && partita.ospite != ""){
                let squadraCasa : Squadra = model.list.first { squadra in
                    squadra.id == partita.casa
                }!
                let squadraOspite : Squadra = model.list.first { squadra in
                    squadra.id == partita.ospite
                }!
                HStack{
                    NavigationLink(destination: SingolaSquadraView(latitudine: squadraCasa.latitudine, longitudine: squadraCasa.longitudine, emoji: squadraCasa.emoji, nome: squadraCasa.nome, descrizione: squadraCasa.descrizione, id: squadraCasa.id, model: model)){
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth:2/3).frame(width:140, height: 140)
                                Text(squadraCasa.emoji).font(.system(size: 70))
                            }
                            Text(squadraCasa.nome.uppercased())
                        }.frame(maxWidth: UIScreen.main.bounds.size.width/2, alignment: .center)
                    }.buttonStyle(PlainButtonStyle())
                    Text("-").font(.largeTitle)
                    NavigationLink(destination: SingolaSquadraView(latitudine: squadraOspite.latitudine, longitudine: squadraOspite.longitudine, emoji: squadraOspite.emoji, nome: squadraOspite.nome, descrizione: squadraOspite.descrizione, id: squadraOspite.id, model: model)){
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth:2/3).frame(width:140, height: 140)
                                Text(squadraOspite.emoji).font(.system(size: 70))
                            }
                            Text(squadraOspite.nome
                                .uppercased())
                        }.frame(maxWidth: UIScreen.main.bounds.size.width/2, alignment: .center)
                    }.buttonStyle(PlainButtonStyle())
                }.frame(width: UIScreen.main.bounds.size.width, height: 200)
            } else {
                HStack{
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth:2/3).frame(width:140, height: 140)
                            Text("⏳").font(.system(size: 70))
                        }
                        if(partita.gruppoCasa == "") {
                            if(partita.id == "63"){
                                Text("L\(partita.partitaCasa)")
                            } else {
                                Text("W\(partita.partitaCasa)")
                            }
                        } else {
                            Text("1° Gruppo \(model.gironi[Int8(partita.gruppoCasa)!]!)")
                        }
                    }.frame(maxWidth: UIScreen.main.bounds.size.width/2, alignment: .center)
                    Text("-").font(.largeTitle)
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth:2/3).frame(width:140, height: 140)
                            Text("⏳").font(.system(size: 70))
                        }
                        if(partita.gruppoOspite == "") {
                            if(partita.id == "63"){
                                Text("L\(partita.partitaOspite)")
                            } else {
                                Text("W\(partita.partitaOspite)")
                            }
                        } else {
                            Text("2° Gruppo \(model.gironi[Int8(partita.gruppoOspite)!]!)")
                        }
                    }.frame(maxWidth: UIScreen.main.bounds.size.width/2, alignment: .center)
                }.frame(width: UIScreen.main.bounds.size.width, height: 200)
            }
            Divider()
            Text(formatter.string(from: partita.data))
            Divider()
            let stadio = model.listStadi.first { stadio in
                stadio.id == partita.stadio
            }!
            VStack{
                MapView(latitudine: stadio.latitudine, longitudine: stadio.longitudine, showPin: true).cornerRadius(10)
            }.padding(.horizontal).frame(width: UIScreen.main.bounds.size.width, height: 200, alignment: .center)
            
            Text("Stadio: \(stadio.nome)").padding(.bottom)
        }.navigationTitle("Partita (\(partita.id))").navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button{
                    bellFilled.toggle()
                } label:{
                    if bellFilled{
                        Label("filled bell", systemImage: "bell.fill")
                    } else {
                        Label("empty bell", systemImage: "bell")
                    }
                }
            }
        }
    }
}

struct PartitaView_Previews: PreviewProvider {
    static var previews: some View {
        PartitaView(model: ViewModel(), partita: Partita(id: "61", casa: "", ospite: "", data: Date(), stadio: "1", golCasa: 0, golOspite: 0, gruppoCasa: "1", gruppoOspite: "2", partitaCasa: "30", partitaOspite: "31"))
            .previewInterfaceOrientation(.portrait)
    }
}
