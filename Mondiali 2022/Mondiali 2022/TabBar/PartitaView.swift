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
    var body: some View {
        VStack{
            Text(partita.id)
        }.navigationTitle("Partita").navigationBarTitleDisplayMode(.inline).toolbar {
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
        PartitaView(model: ViewModel(), partita: Partita(id: "1", casa: "1", ospite: "2", data: Date(), stadio: "1", golCasa: 0, golOspite: 0, gruppoCasa: "1", gruppoOspite: "1", partitaCasa: "", partitaOspite: ""))
    }
}
