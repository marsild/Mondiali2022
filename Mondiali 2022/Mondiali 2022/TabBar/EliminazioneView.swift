//
//  EliminazioneView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct EliminazioneView: View {
    @State var startPos : CGPoint = .zero
    @State var isSwipping = true
    @Binding var showSidebar: Bool
    @ObservedObject var model: ViewModel
    @State var selectedTab: String = "ottavi"
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                Spacer().frame(height:0.2)
                HStack{
                    Text("OTTAVI")
                        .font(.callout)
                        .fontWeight(selectedTab == "ottavi" ? .bold : .thin).onTapGesture {
                            self.selectedTab = "ottavi"
                        }.frame(maxWidth: UIScreen.main.bounds.size.width/4, alignment: .center)
                    Divider()
                    Text("QUARTI")
                        .font(.callout)
                        .fontWeight(selectedTab == "quarti" ? .bold : .thin).onTapGesture {
                            self.selectedTab = "quarti"
                        }.frame(maxWidth: UIScreen.main.bounds.size.width/4, alignment: .center)
                    Divider()
                    Text("SEMI")
                        .font(.callout)
                        .fontWeight(selectedTab == "semi" ? .bold : .thin).onTapGesture {
                            self.selectedTab = "semi"
                        }.frame(maxWidth: UIScreen.main.bounds.size.width/4, alignment: .center)
                    Divider()
                    Text("FINALI")
                        .font(.callout)
                        .fontWeight(selectedTab == "finali" ? .bold : .thin).onTapGesture {
                            self.selectedTab = "finali"
                        }.frame(maxWidth: UIScreen.main.bounds.size.width/4, alignment: .center)
                }.padding(.horizontal).frame(height: UIScreen.main.bounds.size.height/15).background(Color(UIColor.quaternaryLabel)).overlay(Rectangle().stroke(lineWidth: 1/4))
                if(self.selectedTab == "ottavi"){
                    HStack{
                        VStack{
                            ForEach(model.listPartite.sorted(by: { p1, p2 in
                                p1.id < p2.id
                            })){ partita in
                                if(Int(partita.id)! > 48 && Int(partita.id)! < 57){
                                    HStack{
                                        NavigationLink (destination: PartitaView(model: model, partita: partita)) {
                                            VStack(alignment: .leading, spacing: 5){
                                                if(partita.casa != ""){
                                                    Text("\(model.getEmoji(idSquadra: partita.casa)) \(model.nomiSquadre[partita.casa]!)").minimumScaleFactor(0.1).frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("\(model.getEmoji(idSquadra: partita.ospite)) \(model.nomiSquadre[partita.ospite]!)").minimumScaleFactor(0.1)
                                                } else {
                                                    Text("Prima gruppo \(model.gironi[Int8(partita.gruppoCasa)!]!)").minimumScaleFactor(0.1).frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("Seconda gruppo \(model.gironi[Int8(partita.gruppoOspite)!]!)").minimumScaleFactor(0.1)
                                                }
                                            }.padding(.vertical,2).padding(.horizontal).frame(maxWidth: UIScreen.main.bounds.size.width*3/4, maxHeight: UIScreen.main.bounds.height/8).background(Color(UIColor.quaternaryLabel).opacity(0.8)).cornerRadius(10).padding(.leading)
                                        }.buttonStyle(PlainButtonStyle())
                                        Text("(\(partita.id))").font(.footnote)
                                    }
                                }
                            }
                            Spacer()
                        }.frame(maxWidth:UIScreen.main.bounds.size.width*35/50, alignment: .trailing)
                        VStack{
                            Button{
                                self.selectedTab = "quarti"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height/4)
                            Button{
                                self.selectedTab = "quarti"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height/4)
                            Button{
                                self.selectedTab = "quarti"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height/4)
                            Button{
                                self.selectedTab = "quarti"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height/4)
                        }.frame(maxWidth:UIScreen.main.bounds.size.width*15/50, alignment: .center)
                    }
                } else if (self.selectedTab == "quarti"){
                    HStack{
                        VStack{
                            ForEach(model.listPartite.sorted(by: { p1, p2 in
                                p1.id < p2.id
                            })){ partita in
                                if(Int(partita.id)! > 56 && Int(partita.id)! < 61){
                                    HStack{
                                        Button{
                                            self.selectedTab = "ottavi"
                                        } label: {
                                            Label("", systemImage: "chevron.left.circle")
                                        }.padding(.leading)
                                        NavigationLink (destination: PartitaView(model: model, partita: partita)) {
                                            VStack(alignment: .leading, spacing: 10){
                                                if(partita.casa != ""){
                                                    Text("\(model.getEmoji(idSquadra: partita.casa)) \(model.nomiSquadre[partita.casa]!)").minimumScaleFactor(0.1).frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("\(model.getEmoji(idSquadra: partita.ospite)) \(model.nomiSquadre[partita.ospite]!)").minimumScaleFactor(0.1)
                                                } else {
                                                    Text("Vincitore ottavo (\(partita.partitaCasa))").minimumScaleFactor(0.1).frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("Vincitore ottavo (\(partita.partitaOspite))").minimumScaleFactor(0.1)
                                                }
                                            }.padding(.vertical).padding(.horizontal).frame(maxWidth: UIScreen.main.bounds.size.width*3/4).background(Color(UIColor.quaternaryLabel).opacity(0.8)).cornerRadius(10).frame(maxHeight: UIScreen.main.bounds.height/4)
                                        }.buttonStyle(PlainButtonStyle())
                                        Text("(\(partita.id))").font(.footnote)
                                    }
                                }
                            }
                            Spacer()
                        }.padding(.leading)
                        VStack{
                            Button{
                                self.selectedTab = "semi"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height/2)
                            Button{
                                self.selectedTab = "semi"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height/2)
                        }.padding(.trailing)
                    }
                } else if (self.selectedTab == "semi"){
                    HStack{
                        VStack{
                            ForEach(model.listPartite.sorted(by: { p1, p2 in
                                p1.id < p2.id
                            })){ partita in
                                if(Int(partita.id)! == 61 || Int(partita.id)! == 62){
                                    HStack{
                                        Button{
                                            self.selectedTab = "quarti"
                                        } label: {
                                            Label("", systemImage: "chevron.left.circle")
                                        }.padding(.leading)
                                        NavigationLink (destination: PartitaView(model: model, partita: partita)) {
                                            VStack(alignment: .leading, spacing: 10){
                                                if(partita.casa != ""){
                                                    Text("\(model.getEmoji(idSquadra: partita.casa)) \(model.nomiSquadre[partita.casa]!)").frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("\(model.getEmoji(idSquadra: partita.ospite)) \(model.nomiSquadre[partita.ospite]!)")
                                                } else {
                                                    Text("Vincitore quarto (\(partita.partitaCasa))").frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("Vincitore quarto (\(partita.partitaOspite))")
                                                }
                                            }.padding(.vertical).padding(.horizontal).frame(maxWidth: UIScreen.main.bounds.size.width*3/4).background(Color(UIColor.quaternaryLabel).opacity(0.8)).cornerRadius(10).frame(maxHeight: UIScreen.main.bounds.height/2)
                                        }.buttonStyle(PlainButtonStyle())
                                        Text("(\(partita.id))").font(.footnote)
                                    }
                                }
                            }
                            Spacer()
                        }.padding(.leading)
                        VStack{
                            Button{
                                self.selectedTab = "finali"
                            } label: {
                                Label("", systemImage: "chevron.right.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height)
                        }.padding(.trailing)
                    }
                } else {
                    HStack{
                        VStack{
                            Button{
                                self.selectedTab = "semi"
                            } label: {
                                Label("", systemImage: "chevron.left.circle")
                            }.frame(maxHeight: UIScreen.main.bounds.height)
                        }.padding(.leading)
                        VStack{
                            ForEach(model.listPartite.sorted(by: { p1, p2 in
                                p1.id > p2.id
                            })){ partita in
                                if(Int(partita.id)! == 63 || Int(partita.id)! == 64){
                                    HStack{
                                        NavigationLink (destination: PartitaView(model: model, partita: partita)) {
                                            VStack(alignment: .leading, spacing: 10){
                                                if(partita.casa != ""){
                                                    Text("\(model.getEmoji(idSquadra: partita.casa)) \(model.nomiSquadre[partita.casa]!)").frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                    Text("\(model.getEmoji(idSquadra: partita.ospite)) \(model.nomiSquadre[partita.ospite]!)")
                                                } else {
                                                    if(Int(partita.id)! == 64){
                                                        Text("Vincitore semifinale (\(partita.partitaCasa))").frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                        Text("Vincitore semifinale (\(partita.partitaOspite))")
                                                    } else {
                                                        Text("Sconfitto semifinale (\(partita.partitaCasa))").frame(maxWidth: UIScreen.main.bounds.size.width*3/4, alignment: .leading)
                                                        Text("Sconfitto semifinale (\(partita.partitaOspite))")
                                                    }
                                                }
                                            }.padding(.vertical).padding(.horizontal).frame(maxWidth: UIScreen.main.bounds.size.width*3/4).background(Color(UIColor.quaternaryLabel).opacity(0.8)).cornerRadius(10).frame(maxHeight: UIScreen.main.bounds.height/2)
                                        }.buttonStyle(PlainButtonStyle())
                                        VStack{
                                            if(Int(partita.id)! == 64){
                                                Text("FINALE").font(.footnote)
                                            }
                                            else {
                                                Text("3° posto").font(.footnote)
                                            }
                                        }
                                    }.padding(.trailing)
                                }
                            }
                            Spacer()
                        }.padding(.trailing)
                    }
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Eliminazione").toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        withAnimation{
                            self.showSidebar.toggle()
                        }
                    } label:{
                        Label("menu", systemImage: "line.3.horizontal")
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
                let xDist =  abs(gesture.location.x - self.startPos.x)
                let yDist =  abs(gesture.location.y - self.startPos.y)
                if self.startPos.x > gesture.location.x && yDist < xDist {
                    if(self.selectedTab == "ottavi"){
                        self.selectedTab = "quarti"
                    } else if (self.selectedTab == "quarti"){
                        self.selectedTab = "semi"
                    } else if (self.selectedTab == "semi") {
                        self.selectedTab = "finali"
                    }
                }
                else if self.startPos.x < gesture.location.x && yDist < xDist {
                    if(self.selectedTab == "finali"){
                        self.selectedTab = "semi"
                    } else if (self.selectedTab == "semi"){
                        self.selectedTab = "quarti"
                    } else if (self.selectedTab == "quarti") {
                        self.selectedTab = "ottavi"
                    }
                }
                self.isSwipping.toggle()
            }
        )
    }
}

struct EliminazioneView_Previews: PreviewProvider {
    static var previews: some View {
        EliminazioneView(showSidebar: .constant(false), model: ViewModel())
    }
}
