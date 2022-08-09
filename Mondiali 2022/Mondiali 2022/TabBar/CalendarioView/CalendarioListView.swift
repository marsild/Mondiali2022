//
//  CalendarioListView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 08/08/22.
//

import SwiftUI

struct CalendarioListView: View {
    @ObservedObject var model: ViewModel
    var formatter: DateFormatter
    var formatter2: DateFormatter
    init(model: ViewModel){
        self.model = model
        self.formatter = DateFormatter()
        formatter.locale = Locale(identifier: "it")
        formatter.dateFormat = "dd MMMM"
        self.formatter2 = DateFormatter()
        formatter2.locale = Locale(identifier: "it")
        formatter2.dateFormat = "HH:mm"
    }
    var body: some View {
        List{
            let partiteOrdinate = model.listPartite.sorted(by: { p1, p2 in
                p1.data < p2.data
            })
            let partiteMappate = partiteOrdinate.map{
                formatter.string(from: $0.data)
            }.uniqued()
            ForEach(partiteMappate, id: \.self){ data in
                Section {
                    ForEach(partiteOrdinate){ partita in
                        if(formatter.string(from: partita.data) == data){
                            if(partita.casa != ""){
                                partiteGironi(model: model, formatter: formatter, formatter2: formatter2, partita: partita)
                            } else {
                                partiteEliminazione(model: model, formatter: formatter, formatter2: formatter2, partita: partita)
                            }
                        }
                    }
                } header: {
                    Text(data)
                }
                
            }
        }.listStyle(InsetGroupedListStyle())
    }
}

struct CalendarioListView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarioListView(model: ViewModel())
    }
}

struct partiteGironi:View{
    @ObservedObject var model: ViewModel
    var formatter: DateFormatter
    var formatter2: DateFormatter
    var partita: Partita
    var body: some View{
        NavigationLink (destination: PartitaView(model: model, partita: partita)) {
            HStack{
                if( partita.gruppoCasa == "" || partita.gruppoCasa != partita.gruppoOspite ) {
                    if(partita.gruppoCasa == ""){
                        if(partita.id == "64"){
                            Text("Finale (\(partita.id))").font(.footnote)
                        } else if(partita.id == "63"){
                            Text("3° posto (\(partita.id))").font(.footnote)
                        } else if((partita.id == "62") || (partita.id == "61")){
                            Text("Semifinale (\(partita.id))").font(.footnote)
                        } else {
                            Text("Quarti (\(partita.id))").font(.footnote)
                        }
                    } else {
                        Text("Ottavi (\(partita.id))").font(.footnote)
                    }
                } else {
                    Text("Gruppo \(model.gironi[Int8(partita.gruppoCasa)!]!)").font(.footnote)
                }
                Divider()
                VStack(alignment: .leading, spacing: 5){
                    Text("\(model.getEmoji(idSquadra: partita.casa)) \(model.nomiSquadre[partita.casa]!)")
                    Text("\(model.getEmoji(idSquadra: partita.ospite)) \(model.nomiSquadre[partita.ospite]!)")
                }.padding(.vertical,2)
                Spacer()
                Text(formatter2.string(from: partita.data)).font(.callout).fontWeight(.light)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}
struct partiteEliminazione:View{
    @ObservedObject var model: ViewModel
    var formatter: DateFormatter
    var formatter2: DateFormatter
    var partita: Partita
    var body: some View{
        NavigationLink (destination: PartitaView(model: model, partita: partita)) {
            HStack{
                if(partita.gruppoCasa == ""){
                    if(partita.id == "64"){
                        Text("Finale (\(partita.id))").font(.footnote)
                    } else if(partita.id == "63"){
                        Text("3° posto (\(partita.id))").font(.footnote)
                    } else if((partita.id == "62") || (partita.id == "61")){
                        Text("Semifinale (\(partita.id))").font(.footnote)
                    } else {
                        Text("Quarti (\(partita.id))").font(.footnote)
                    }
                } else {
                    Text("Ottavi (\(partita.id))").font(.footnote)
                }
                Divider()
                if(partita.gruppoCasa == ""){
                    if(partita.id == "63"){
                        Text("L\(partita.partitaCasa) - L\(partita.partitaOspite)")
                    } else {
                        Text("W\(partita.partitaCasa) - W\(partita.partitaOspite)")
                    }
                } else {
                    Text("1\(model.gironi[Int8(partita.gruppoCasa)!]!) - 2\(model.gironi[Int8(partita.gruppoOspite)!]!)")
                }
                Spacer()
                Text(formatter2.string(from: partita.data)).font(.callout).fontWeight(.light)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
