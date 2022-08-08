//
//  CalendarioView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct CalendarioView: View {
    @State var startPos : CGPoint = .zero
    @State var isSwipping = true
    @Binding var showSidebar: Bool
    @ObservedObject var model: ViewModel
    @State var listView = false
    var formatter = DateFormatter()
    var formatter2 = DateFormatter()
    var formatter3 = DateFormatter()
    @State var date = Date()
    init(showSidebar: Binding<Bool>, model: ViewModel){
        self.model = model
        self._showSidebar = showSidebar
        formatter.locale = Locale(identifier: "it")
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter2.locale = Locale(identifier: "it")
        formatter2.dateFormat = "dd MMMM"
        formatter3.locale = Locale(identifier: "it")
        formatter3.dateFormat = "HH:mm"
        self.date = Date()
    }
    var body: some View {
        NavigationView{
            VStack{
                if(listView){
                    CalendarioListView(model: model)
                } else {
                    HStack{
                        Button{
                            date.addTimeInterval(-24*60*60)
                        } label: {
                            Label("", systemImage: "chevron.left.circle")
                        }.disabled(date <= formatter.date(from: "2022/11/21 00:00")! ? true : false).frame(width: UIScreen.main.bounds.width/3, alignment: .trailing)
                        CalendarPickerView(date: self.$date).frame(width: UIScreen.main.bounds.width/3, alignment: .center)
                        Button{
                            date.addTimeInterval(24*60*60)
                        } label: {
                            Label("", systemImage: "chevron.right.circle")
                        }.disabled(date >= formatter.date(from: "2022/12/17 23:59")! ? true : false).frame(width: UIScreen.main.bounds.width/3, alignment: .leading)
                    }.padding(.vertical,5)
                    List{
                        ForEach(model.listPartite.sorted(by: { p1, p2 in
                            p1.data < p2.data
                        })){ partita in
                            if(formatter2.string(from: partita.data) == formatter2.string(from:self.date)){
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
                                        Text(formatter3.string(from: partita.data)).font(.callout).fontWeight(.light)
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
                                        Text(formatter3.string(from: partita.data)).font(.callout).fontWeight(.light)
                                    }
                                }
                            }
                        }
                    }.listStyle(PlainListStyle()).onAppear{
                        if(date <= formatter.date(from: "2022/11/21 00:00")! || date >= formatter.date(from: "2022/12/18 23:59")!){
                            date = formatter.date(from: "2022/11/21 00:00")!
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Calendario").toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        withAnimation{
                            self.showSidebar.toggle()
                        }
                    } label:{
                        Label("menu", systemImage: "line.3.horizontal")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if listView {
                        Button{
                            self.listView.toggle()
                        } label:{
                            Label("calendar view", systemImage: "calendar")
                        }
                    } else {
                        Button{
                            self.listView.toggle()
                        } label:{
                            Label("list view", systemImage: "list.bullet.circle")
                        }
                    }
                }
            }
        }.gesture(DragGesture()
            .onChanged { gesture in
                if self.isSwipping {
                    self.startPos = gesture.location
                    self.isSwipping.toggle()
                }
            }
            .onEnded { gesture in
                if(!listView){
                    let xDist =  abs(gesture.location.x - self.startPos.x)
                    let yDist =  abs(gesture.location.y - self.startPos.y)
                    if self.startPos.x > gesture.location.x && yDist < xDist {
                        if(date <= formatter.date(from: "2022/12/17 23:59")!){
                            date.addTimeInterval(24*60*60)
                        }
                    }
                    else if self.startPos.x < gesture.location.x && yDist < xDist {
                        if(date >= formatter.date(from: "2022/11/22 00:00")!){
                            date.addTimeInterval(-24*60*60)
                        }
                    }
                    self.isSwipping.toggle()
                }
            }
        )
    }
}

struct CalendarioView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarioView(showSidebar: .constant(false), model: ViewModel())
    }
}
