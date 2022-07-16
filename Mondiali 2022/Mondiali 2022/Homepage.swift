//
//  Homepage.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 13/07/22.
//

import SwiftUI

struct Homepage: View {
    @Environment(\.verticalSizeClass) var sizeClass
    @State private var showView = ""
    @State private var opacity = 1.0
    var body: some View {
        switch showView{
        case "squadre":
            TabBarView(selectedTab: "One").transition(.move(edge: .trailing))
        case "tabelloni":
            TabBarView(selectedTab: "Two").transition(.move(edge: .trailing))
        case "calendario":
            TabBarView(selectedTab: "Four").transition(.move(edge: .trailing))
        default:
            NavigationView{
                VStack{
                    NavigationLink(destination: InfoQatarView()) {
                        VStack{
                            Image("Cup").resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.size.height*220/400)
                            VStack{
                                Text("WORLD CUP")
                                    .font(.title2)
                                    .minimumScaleFactor(0.01)
                                Text("QATAR")
                                    .font(.title2)
                                    .minimumScaleFactor(0.01)
                                Text("2022")
                                    .font(.system(size: 50))
                                    .minimumScaleFactor(0.01)
                            }.frame(height: UIScreen.main.bounds.size.height/6)
                        }
                    }.buttonStyle(PlainButtonStyle())
                    HStack{
                        /*CREARE METODO UNICO - STESSO BLOCCO RIPETUTO 3 VOLTE*/
                        VStack{
                            Text("🗺").font(.largeTitle).padding(.top)
                            Text("SQUADRE")
                                .font(.callout)
                                .padding(.bottom)
                        }.frame(width: UIScreen.main.bounds.size.width*115/400,height: UIScreen.main.bounds.size.height*12/60).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2/3)
                        ).onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "squadre"
                            }
                        }
                        VStack{
                            Text("🏆").font(.largeTitle).padding(.top)
                            Text("TABELLONI")
                                .font(.callout)
                                .padding(.bottom)
                        }.frame(width: UIScreen.main.bounds.size.width*115/400,height: UIScreen.main.bounds.size.height*12/60).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2/3)
                        ).onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "tabelloni"
                            }
                        }
                        VStack{
                            Text("🗓").font(.largeTitle).padding(.top)
                            Text("CALENDARIO").font(.callout).padding(.bottom)
                        }.frame(width: UIScreen.main.bounds.size.width*115/400,height: UIScreen.main.bounds.size.height*12/60).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2/3)
                        ).onTapGesture{
                            withAnimation(.easeIn) {
                                showView = "calendario"
                            }
                        }
                    }
                    .padding().frame( width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height/5)
                    
                }.navigationBarHidden(true).opacity(opacity)
            }
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
        Homepage().preferredColorScheme(.dark)
    }
}
