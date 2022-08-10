//
//  SingolaSquadraView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 19/07/22.
//

import SwiftUI

struct SingolaSquadraView: View {
    var latitudine: Double
    var longitudine: Double
    var emoji: String
    var nome: String
    var descrizione: String
    var id: String
    @ObservedObject var model: ViewModel
    @Environment(\.verticalSizeClass) var sizeClass
    @State var bellFilled: Bool = false
    @State var partiteNotificheArray : [String] = UserDefaults.standard.object(forKey: "partiteNotifiche") as? [String] ?? []
    @State private var isPresentingAlert: Bool = false
    init(latitudine: Double, longitudine: Double, emoji: String, nome: String, descrizione: String, id: String, model: ViewModel){
        self.latitudine = latitudine
        self.longitudine = longitudine
        self.emoji = emoji
        self.nome = nome
        self.descrizione = descrizione
        self.id = id
        self.model = model
        var tuttePresenti = true
        for partita in model.partiteSquadra(idSquadra: id){
            if(!partiteNotificheArray.contains(partita.id)){
                tuttePresenti = false
            }
        }
        if(tuttePresenti){
            bellFilled = true
        }
    }
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                MapView(latitudine: latitudine, longitudine: longitudine, showPin: false).frame(height:UIScreen.main.bounds.size.height*4/10)
                ZStack{
                    Circle()
                        .strokeBorder(.secondary, lineWidth: 2)
                        .background(Circle().fill(.background))
                        .frame(width: 120, height: 120)
                        .shadow(radius: 7)
                    Text(emoji).font(.system(size: 60)).minimumScaleFactor(0.01)
                        .frame(width: 120, height: 120).aspectRatio(contentMode: .fit)
                }.frame(width: UIScreen.main.bounds.size.width, alignment: .center).offset(y:-70).padding(.bottom, -75)
            }
            VStack(alignment: .leading) {
                Text(nome).font(.title).frame(width:UIScreen.main.bounds.width, alignment: .center)
                Divider()
                Text(descrizione)
                    .font(.callout)
                    .padding(.horizontal)
                Divider()
                DisclosureGroup("Convocati"){
                    ConvocatiSquadraView(giocatori: model.giocatoriInSquadra(squadra: self.id))/*.onAppear{model.jsonPrintPlayers()
                        model.jsonPrintSquads()
                    }*/
                }.padding(.horizontal)
                Divider().padding(.bottom)
            }
        }.frame(width:UIScreen.main.bounds.width, alignment: .leading)
            .navigationTitle(nome)
            .navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        if bellFilled{
                            var array = partiteNotificheArray
                            for partita in model.partiteSquadra(idSquadra: id){
                                if(partiteNotificheArray.contains(partita.id)){
                                    array.removeAll { s in
                                        s == partita.id
                                    }
                                    NotificationManager.istance.cancelNotification(id: partita.id)
                                    UserDefaults.standard.setValue(array, forKey: "partiteNotifiche")
                                }
                            }
                            bellFilled = false
                        } else {
                            UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { (settings) in
                                if settings.authorizationStatus == .notDetermined {
                                    NotificationManager.istance.requestAuthorization()
                                } else if settings.authorizationStatus == .denied {
                                    isPresentingAlert = true
                                } else if settings.authorizationStatus == .authorized {
                                    var array = partiteNotificheArray
                                    for partita in model.partiteSquadra(idSquadra: id){
                                        if(!partiteNotificheArray.contains(partita.id)){
                                            array.append(partita.id)
                                            NotificationManager.istance.scheduleNotification(id: partita.id, data: partita.data)
                                            UserDefaults.standard.setValue(array, forKey: "partiteNotifiche")
                                        }
                                    }
                                    bellFilled = true
                                }
                            })
                        }
                    } label:{
                        if bellFilled{
                            Label("filled bell", systemImage: "bell.fill")
                        } else {
                            Label("empty bell", systemImage: "bell")
                        }
                    }
                }
            }.onAppear{
                partiteNotificheArray = UserDefaults.standard.object(forKey: "partiteNotifiche") as? [String] ?? []
                UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { (settings) in
                    if settings.authorizationStatus == .authorized {
                        var tuttePresenti = true
                        for partita in model.partiteSquadra(idSquadra: id){
                            if(!partiteNotificheArray.contains(partita.id)){
                                tuttePresenti = false
                            }
                        }
                        if(tuttePresenti){
                            bellFilled = true
                        }
                    }
                })
                NotificationManager.istance.printNotificationsInPending()
            }.alert("Le notifiche non sono attive. Autorizzale dalle impostazioni se vuoi procedere.",
                    isPresented: $isPresentingAlert) {
            }
    }
}
/*
struct SingolaSquadraView_Previews: PreviewProvider {
    static var previews: some View {
        SingolaSquadraView(latitudine: 0.0, longitudine: 0.0, emoji: "🇦🇷", nome: "Argentina", descrizione: "test", id: "1")
    }
}*/
