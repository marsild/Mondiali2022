//
//  InfoQatarView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI
import YouTubePlayerKit

struct InfoQatarView: View {
    @Environment(\.verticalSizeClass) var sizeClass
    @ObservedObject var model: ViewModel
    var formatter : DateFormatter
    let youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=70aK4grhTMQ"
    init(model: ViewModel){
        self.model = model
        formatter = DateFormatter()
        formatter.locale = Locale(identifier: "it")
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
    }
    var body: some View {
        ScrollView{
            Text("Q A T A R   2 0 2 2").font(.largeTitle).fontWeight(.bold).frame(width: UIScreen.main.bounds.size.width, alignment: .center).padding(.vertical)
            YouTubePlayerView(self.youTubePlayer) { state in
                // Overlay ViewBuilder closure to place an overlay View
                // for the current `YouTubePlayer.State`
                switch state {
                case .idle:
                    ProgressView()
                case .ready:
                    EmptyView()
                case .error(_):
                    Text(verbatim: "Errore nel caricamento del player YouTube")
                }
            }.frame(height: 300, alignment: .center).padding(.horizontal)
            Text("Il campionato mondiale di calcio 2022 sarà la 22ª edizione del campionato mondiale di calcio per le rappresentative (comunemente chiamate \"nazionali\") maschili maggiori delle federazioni affiliate alla Fédération Internationale de Football Association che si svolgerà in Qatar dal 20 novembre al 18 dicembre 2022.").padding(.horizontal)
            if(Date.now < formatter.date(from: "2022/11/21 13:00")!){
                VStack(alignment: .center){
                    Text("COUNTDOWN").font(.callout)
                    CountDownView(referenceDate: formatter.date(from: "2022/11/20 17:00")!)
                }.padding(.vertical).frame(maxWidth:UIScreen.main.bounds.size.width).overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 2/3)).padding(.horizontal).padding(.bottom)
            }
            Text("Sarà l'ultima edizione del torneo a prevedere la partecipazione di sole 32 nazionali, poiché dal 2026 il mondiale verrà esteso a 48 squadre. Per la prima volta nella storia dei mondiali, la competizione non si disputerà nei mesi di giugno e luglio ma in quelli di novembre e dicembre, cioè nel periodo autunnale dell'emisfero boreale. Questa novità è dovuta al fatto che, svolgendosi il torneo in una zona molto calda, nel periodo estivo le temperature sarebbero proibitive.").padding(.horizontal)
            Divider()
            DisclosureGroup("Stadi"){
                ForEach(model.listStadi){ s in
                    NavigationLink(destination: SingoloStadioView(imgStadio: model.stadiumImages[s.id], nome: s.nome, descrizione: s.descrizione, capacita: s.capacita, latitudine: s.latitudine, longitudine: s.longitudine)) {
                        StadioColumnView(model: model, urlFoto: s.urlFoto, nomeStadio: s.nome, idStadio: s.id)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(.vertical)
            }.padding(.horizontal)
            Divider().padding(.bottom)
        }.frame(width: UIScreen.main.bounds.size.width, alignment: .leading).navigationTitle("Info")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoQatarView_Previews: PreviewProvider {
    static var previews: some View {
        InfoQatarView(model: ViewModel())
    }
}
