//
//  SideBarView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct SideMenuView: View {
    @ObservedObject var model: ViewModel
    @Binding var showSidebar: Bool
    @State private var showView = ""
    @State var startPos : CGPoint = .zero
    @State var isSwipping = true
    var body: some View {
        switch showView{
        case "crea":
            CreaSquadraView(model: model).transition(.opacity)
        case "predici":
            PrediciFuturoView(model: model).transition(.opacity)
        default:
            NavigationView{
                VStack(alignment: .leading){
                    Divider()
                    Group{
                        HStack{
                            Image(systemName: "house").frame(width: 40)
                            Text("Homepage")
                            Spacer()
                        }.contentShape(Rectangle()).onTapGesture{
                            withAnimation(.easeIn) {
                                AppState.shared.gameID = UUID()
                            }
                        }.padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "person.3").frame(width: 40)
                            Text("Crea la tua squadra")
                            Spacer()
                        }.contentShape(Rectangle()).onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "crea"
                            }
                        }.padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "lasso.and.sparkles").frame(width: 40)
                            Text("Predici il futuro")
                            Spacer()
                        }.contentShape(Rectangle()).onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "predici"
                            }
                        }.padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "exclamationmark.triangle").frame(width: 40)
                            Text("Segnala")
                            Spacer()
                        }.contentShape(Rectangle()).onTapGesture{
                            let email = "marsild.spahiu@studio.unibo.it"
                            let subject = "Mondiali 2022: Feedback"
                            let body = "Fornisci il tuo feedback qui e ti contatteremo entro le prossime 24-48 ore."
                            guard let url = URL(string: "mailto:\(email)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")") else { return }
                            UIApplication.shared.open(url)
                        }.padding(.leading)
                        Divider()
                    }
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .leading).navigationBarTitleDisplayMode(.inline).navigationTitle("Menù").navigationBarBackButtonHidden(true).toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button{
                            withAnimation{
                                self.showSidebar.toggle()
                            }
                        } label:{
                            Label("back", systemImage: "chevron.forward")
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
                        withAnimation{
                            self.showSidebar = false
                        }
                    }
                    self.isSwipping.toggle()
                }
            )
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(model: ViewModel(), showSidebar: .constant(true))
    }
}
