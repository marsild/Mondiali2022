//
//  SingoloStadioView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 06/08/22.
//

import SwiftUI

struct SingoloStadioView: View {
    @Environment(\.verticalSizeClass) var sizeClass
    
    var imgStadio: (UIImage, URL)?
    var nome: String
    var descrizione: String
    var capacita: String
    var latitudine: Double
    var longitudine: Double
    
    var body: some View {
        ScrollView {
            VStack{
                if let image = imgStadio?.0 {
                    Image(uiImage: image)
                        .resizable()
                        .cornerRadius(10)
                } else {
                    ProgressView()
                }
            }.padding([.top,.leading,.trailing]).frame(width: UIScreen.main.bounds.size.width, height: 250, alignment: .center)
            Divider()
            Text("Capacità: \(capacita)").padding(.horizontal).frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
            Divider()
            Text(descrizione).font(.callout).padding(.horizontal).frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
            VStack{
                MapView(latitudine: latitudine, longitudine: longitudine, showPin: true).cornerRadius(10)
            }.padding([.leading,.trailing,.bottom]).frame(width: UIScreen.main.bounds.size.width, height: 300, alignment: .center)
        }.navigationTitle(nome).navigationBarTitleDisplayMode(.inline).frame(width:UIScreen.main.bounds.size.width, alignment: .leading).padding(.horizontal)
    }
}

struct SingoloStadioView_Previews: PreviewProvider {
    static var previews: some View {
        SingoloStadioView(nome: "Lusail Stadium", descrizione: "ciaooooooo", capacita: "60000", latitudine: 0.0, longitudine: 0.0)
    }
}
