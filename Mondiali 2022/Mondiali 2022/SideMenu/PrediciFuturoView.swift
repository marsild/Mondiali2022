//
//  PrediciFuturoView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct PrediciFuturoView: View {
    @State var showAlertHomepage = false
    @State var showAlertRestart = false
    
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
    //ottavi
    @State var squadra17 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra18 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra19 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra20 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra21 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra22 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra23 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra24 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    //quarti
    @State var squadra25 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra26 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra27 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra28 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    //semi
    @State var squadra29 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra30 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    //fin
    @State var squadra31 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    @State var squadra32 = Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1)
    var body: some View {
        NavigationView{
            ScrollView{
            HStack{
                VStack{
                    SingoloGironePrediciView(model: model, squadra1: $squadra1, squadra2: $squadra2, gruppo: 1)
                    SingoloGironePrediciView(model: model, squadra1: $squadra3, squadra2: $squadra4, gruppo: 2)
                    SingoloGironePrediciView(model: model, squadra1: $squadra5, squadra2: $squadra6, gruppo: 3)
                    SingoloGironePrediciView(model: model, squadra1: $squadra7, squadra2: $squadra8, gruppo: 4)
                }.frame(width:UIScreen.main.bounds.size.width*3/10)
                VStack(spacing: 0){
                    Text("OTTAVI").font(.footnote).fontWeight(.bold).padding(.bottom,5)
                    Group{
                    //squadra1 vs squadra4
                        HStack{
                            PartitaEliminazioneView(model: model, squadra1: squadra1, squadra2: squadra4, squadraSelected: $squadra17)
                            //squadra5 vs squadra8
                            PartitaEliminazioneView(model: model, squadra1: squadra5, squadra2: squadra8, squadraSelected: $squadra18)
                        }
                        HStack{
                            //squadra3 vs squadra2
                            PartitaEliminazioneView(model: model, squadra1: squadra3, squadra2: squadra2, squadraSelected: $squadra19)
                            //squadra7 vs squadra6
                            PartitaEliminazioneView(model: model, squadra1: squadra7, squadra2: squadra6, squadraSelected: $squadra20)
                        }
                        HStack{
                            //squadra9 vs squadra12
                            PartitaEliminazioneView(model: model, squadra1: squadra9, squadra2: squadra12, squadraSelected: $squadra21)
                            //squadra13 vs squadra16
                            PartitaEliminazioneView(model: model, squadra1: squadra13, squadra2: squadra16, squadraSelected: $squadra22)
                        }
                        HStack{
                            //squadra11 vs squadra10
                            PartitaEliminazioneView(model: model, squadra1: squadra11, squadra2: squadra10, squadraSelected: $squadra23)
                            //squadra15 vs squadra14
                            PartitaEliminazioneView(model: model, squadra1: squadra15, squadra2: squadra14, squadraSelected: $squadra24)
                        }
                    }
                    Divider().padding(.vertical,5)
                    Group{
                        
                        Text("QUARTI").font(.footnote).fontWeight(.bold).padding(.bottom,5)
                        HStack{
                            //squadra17 vs squadra18
                            PartitaEliminazioneView(model: model, squadra1: squadra17, squadra2: squadra18, squadraSelected: $squadra25)
                            //squadra19 vs squadra20
                            PartitaEliminazioneView(model: model, squadra1: squadra19, squadra2: squadra20, squadraSelected: $squadra26)
                        }
                        HStack{
                            //squadra21 vs squadra22
                            PartitaEliminazioneView(model: model, squadra1: squadra21, squadra2: squadra22, squadraSelected: $squadra27)
                            //squadra23 vs squadra24
                            PartitaEliminazioneView(model: model, squadra1: squadra23, squadra2: squadra24, squadraSelected: $squadra28)
                        }
                    }
                    Divider().padding(.vertical,5)
                    Group{
                        
                        Text("SEMI").font(.footnote).fontWeight(.bold).padding(.bottom,5)
                        HStack{
                            //25 vs 27
                            PartitaEliminazioneView(model: model, squadra1: squadra25, squadra2: squadra27, squadraSelected: $squadra29)
                            //26 vs 28
                            PartitaEliminazioneView(model: model, squadra1: squadra26, squadra2: squadra28, squadraSelected: $squadra30)
                        }
                    }
                    
                    Divider().padding(.vertical,5)
                    Group{
                    Text("3°/4°").font(.footnote).fontWeight(.bold).padding(.bottom,5)
                    PartitaEliminazioneView(model: model, squadra1: squadra29.id == "100" ? Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1) : ( squadra29.id == squadra25.id ? squadra27 : squadra25 ), squadra2: squadra30.id == "100" ? Squadra(id: "100", nome: "abc", emoji: "a", descrizione: "a", gruppo: 10, latitudine: 0.1, longitudine: 0.1) : ( squadra30.id == squadra26.id ? squadra28 : squadra26  ), squadraSelected: $squadra31)
                    }
                    Divider().padding(.vertical,5)
                    Group{
                    Text("FINALE").font(.footnote).fontWeight(.bold).padding(.bottom,5)
                    PartitaEliminazioneView(model: model, squadra1: squadra29, squadra2: squadra30, squadraSelected: $squadra32)
                    }
                }.frame(width:UIScreen.main.bounds.size.width*4/10)
                VStack{
                    SingoloGironePrediciView(model: model, squadra1: $squadra9, squadra2: $squadra10, gruppo: 5)
                    SingoloGironePrediciView(model: model, squadra1: $squadra11, squadra2: $squadra12, gruppo: 6)
                    SingoloGironePrediciView(model: model, squadra1: $squadra13, squadra2: $squadra14, gruppo: 7)
                    SingoloGironePrediciView(model: model, squadra1: $squadra15, squadra2: $squadra16, gruppo: 8)
                }.frame(width:UIScreen.main.bounds.size.width*3/10)
            }.padding(.vertical)}.navigationBarTitleDisplayMode(.inline).navigationTitle("Predici il futuro").toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        if isModified(){
                            showAlertHomepage = true
                        } else {
                            withAnimation{
                                AppState.shared.gameID = UUID()
                            }
                        }
                    } label:{
                        Label("home", systemImage: "house")
                    }.alert("Sicuro di voler tornare nella homepage?", isPresented: $showAlertHomepage){
                        Button("Annulla", role: .cancel){
                            showAlertHomepage = false
                        }
                        Button("Continua", role: .destructive){
                            withAnimation{
                                AppState.shared.gameID = UUID()
                            }
                        }
                    } message : {
                        Text("Cliccando su 'Continua', tutte le modifiche attuali andranno perse")
                    }
                    
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        if isModified(){
                            showAlertRestart = true
                        }
                    } label:{
                        Label("restart", systemImage: "arrow.counterclockwise")
                    }.alert("Sicuro di voler ricominciare?", isPresented: $showAlertRestart){
                        Button("Annulla", role: .cancel){
                            showAlertRestart = false
                        }
                        Button("Continua", role: .destructive){
                            refresh()
                        }
                    } message : {
                        Text("Cliccando su 'Continua', tutte le modifiche attuali andranno perse")
                    }
                }
            }
        }
    }
    func isModified() -> Bool {
        var modified = false
        if (squadra1.id != "100" || squadra2.id != "100" || squadra3.id != "100" || squadra4.id != "100" || squadra5.id != "100" || squadra6.id != "100" || squadra7.id != "100" || squadra8.id != "100" || squadra9.id != "100" || squadra10.id != "100" || squadra11.id != "100" || squadra12.id != "100" || squadra13.id != "100" || squadra14.id != "100" || squadra15.id != "100" || squadra16.id != "100" || squadra17.id != "100" || squadra18.id != "100" || squadra19.id != "100" || squadra20.id != "100" || squadra21.id != "100" || squadra22.id != "100" || squadra23.id != "100" || squadra24.id != "100" || squadra25.id != "100" || squadra26.id != "100" || squadra27.id != "100" || squadra28.id != "100" || squadra29.id != "100" || squadra30.id != "100" || squadra31.id != "100" || squadra32.id != "100") {
            modified = true
        }
        return modified
    }
    func refresh(){
        squadra1.id = "100"
        squadra2.id = "100"
        squadra3.id = "100"
        squadra4.id = "100"
        squadra5.id = "100"
        squadra6.id = "100"
        squadra7.id = "100"
        squadra8.id = "100"
        squadra9.id = "100"
        squadra10.id = "100"
        squadra11.id = "100"
        squadra12.id = "100"
        squadra13.id = "100"
        squadra14.id = "100"
        squadra15.id = "100"
        squadra16.id = "100"
        squadra17.id = "100"
        squadra18.id = "100"
        squadra19.id = "100"
        squadra20.id = "100"
        squadra21.id = "100"
        squadra22.id = "100"
        squadra23.id = "100"
        squadra24.id = "100"
        squadra25.id = "100"
        squadra26.id = "100"
        squadra27.id = "100"
        squadra28.id = "100"
        squadra29.id = "100"
        squadra30.id = "100"
        squadra31.id = "100"
        squadra32.id = "100"
    }
}

struct PrediciFuturoView_Previews: PreviewProvider {
    static var previews: some View {
        PrediciFuturoView(model: ViewModel())
    }
}
