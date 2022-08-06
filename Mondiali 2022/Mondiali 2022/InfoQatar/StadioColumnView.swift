//
//  StadioColumnView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 05/08/22.
//

import SwiftUI

struct StadioColumnView: View {
    @ObservedObject var model: ViewModel
    var urlFoto: String
    var nomeStadio: String
    var idStadio: String
    var body: some View {
        HStack{
            if let image = model.stadiumImages[idStadio]?.0 {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 100, alignment: .center).cornerRadius(10)
            } else {
                ProgressView().frame(width: 150, height: 100, alignment: .center).cornerRadius(10)
            }
            Text(nomeStadio).padding(.leading)
            Spacer()
            Label("", systemImage: "chevron.right.circle").foregroundColor(Color.blue)
        }.frame(maxWidth: UIScreen.main.bounds.size.width).padding(.horizontal)
    }
}

struct StadioColumnView_Previews: PreviewProvider {
    static var previews: some View {
        StadioColumnView(model: ViewModel(), urlFoto: "nada", nomeStadio: "San Siro", idStadio: "1")
    }
}

