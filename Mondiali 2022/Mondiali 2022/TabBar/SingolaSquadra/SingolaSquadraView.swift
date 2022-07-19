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
    @Environment(\.verticalSizeClass) var sizeClass
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                MapView(latitudine: latitudine, longitudine: longitudine).frame(height:UIScreen.main.bounds.size.height*4/10)
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
                HStack{
                    Text(nome).font(.title)
                    Label("", systemImage: "bell" )
                }.frame(width:UIScreen.main.bounds.width, alignment: .center)
                Divider()
                Text(descrizione)
                    .font(.callout)
                    .padding(.horizontal)
                Divider()
            }
        }.frame(width:UIScreen.main.bounds.width, alignment: .leading)
            .navigationTitle(nome)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SingolaSquadraView_Previews: PreviewProvider {
    static var previews: some View {
        SingolaSquadraView(latitudine: 0.0, longitudine: 0.0, emoji: "🇦🇷", nome: "Argentina", descrizione: "test", id: "1")
    }
}
