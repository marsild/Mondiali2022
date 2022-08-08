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
            ForEach(model.listPartite.sorted(by: { p1, p2 in
                p1.data < p2.data
            }).map{
                formatter.string(from: $0.data)
            }.uniqued(), id: \.self){ data in
                Section {
                    ForEach(model.listPartite.sorted(by: { p1, p2 in
                        p1.data < p2.data
                    })){ partita in
                        if(formatter.string(from: partita.data) == data){
                            let gruppoCasa = partita.gruppoCasa
                            let gruppoOspite = partita.gruppoOspite
                            if(partita.casa != ""){
                                HStack{
                                    if( gruppoCasa == "" || gruppoCasa != gruppoOspite ) {
                                        if(gruppoCasa == ""){
                                            if(partita.id == "64"){
                                                Text("Finale (\(partita.id))").font(.footnote)
                                            } else if(partita.id == "63"){
                                                Text("3° posto (\(partita.id))").font(.footnote)
                                            } else if(partita.id == "62" || partita.id == "61"){
                                                Text("Semifinale (\(partita.id))").font(.footnote)
                                            } else {
                                                Text("Quarti (\(partita.id))").font(.footnote)
                                            }
                                        } else {
                                            Text("Ottavi (\(partita.id))").font(.footnote)
                                        }
                                    } else {
                                        Text("Gruppo \(model.gironi[Int8(gruppoCasa)!]!)").font(.footnote)
                                    }
                                    Divider()
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("\(model.getEmoji(idSquadra: partita.casa)) \(model.nomiSquadre[partita.casa]!)")
                                        Text("\(model.getEmoji(idSquadra: partita.ospite)) \(model.nomiSquadre[partita.ospite]!)")
                                    }.padding(.vertical,2)
                                    Spacer()
                                    Text(formatter2.string(from: partita.data)).font(.callout).fontWeight(.light)
                                }
                            } else {
                                HStack{
                                    if(partita.gruppoCasa == ""){
                                        if(partita.id == "64"){
                                            Text("Finale (\(partita.id))").font(.footnote)
                                        } else if(partita.id == "63"){
                                            Text("3° posto (\(partita.id))").font(.footnote)
                                        } else if(partita.id == "62" || partita.id == "61"){
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
                                        Text("1\(model.gironi[Int8(gruppoCasa)!]!) - 2\(model.gironi[Int8(gruppoOspite)!]!)")
                                    }
                                    Spacer()
                                    Text(formatter2.string(from: partita.data)).font(.callout).fontWeight(.light)
                                }
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

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
