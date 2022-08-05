//
//  InfoQatarView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct InfoQatarView: View {
    @Environment(\.verticalSizeClass) var sizeClass
    @ObservedObject var model: ViewModel
    var formatter : DateFormatter
    init(model: ViewModel){
        self.model = model
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
    }
    var body: some View {
        ScrollView{
            if(Date.now < formatter.date(from: "2022/11/21 13:00")!){
                CountDownView(referenceDate: formatter.date(from: "2022/11/21 13:00")!)
            }
            Divider()
            DisclosureGroup("Stadi"){
                ForEach(model.listStadi){ s in
                    StadioColumnView(model: model, urlFoto: s.urlFoto, nomeStadio: s.nome, idStadio: s.id)
                }.padding(.vertical)
            }.padding(.horizontal)
            Divider().padding(.bottom)

            
            
        }.frame(width: UIScreen.main.bounds.size.width, alignment: .leading).navigationTitle("Qatar 2022")
            .navigationBarTitleDisplayMode(.inline)
    }
}
/*
 struct InfoQatarView_Previews: PreviewProvider {
 static var previews: some View {
 InfoQatarView()
 }
 }*/
