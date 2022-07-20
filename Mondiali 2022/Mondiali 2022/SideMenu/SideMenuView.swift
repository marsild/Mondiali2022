//
//  SideBarView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var showSidebar: Bool
    @State private var showView = ""
    var body: some View {
        let drag = DragGesture()
            .onChanged {
                if $0.translation.width < -50 {
                    withAnimation {
                        self.showSidebar = false
                    }
                }
            }
        switch showView{
        case "crea":
            CreaSquadraView().transition(.opacity)
        case "predici":
            PrediciFuturoView().transition(.opacity)
        case "segnala":
            SegnalaView().transition(.opacity)
        default:
            NavigationView{
                VStack(alignment: .leading){
                    Divider()
                    Group{
                        HStack{
                            Image(systemName: "house").frame(width: 40)
                            Text("Homepage")
                        }.onTapGesture{
                            withAnimation(.easeIn) {
                                AppState.shared.gameID = UUID()
                            }
                        }.padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "person.3").frame(width: 40)
                            Text("Crea la tua squadra")
                        }.onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "crea"
                            }
                        }.padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "lasso.and.sparkles").frame(width: 40)
                            Text("Predici il futuro")
                        }.onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "predici"
                            }
                        }.padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "exclamationmark.triangle").frame(width: 40)
                            Text("Segnala")
                        }.onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "segnala"
                            }
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
            }.gesture(drag)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showSidebar: .constant(true))
    }
}
