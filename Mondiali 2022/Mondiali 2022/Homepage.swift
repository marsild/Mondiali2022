//
//  Homepage.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 13/07/22.
//

import SwiftUI

struct Homepage: View {
    @Environment(\.verticalSizeClass) var sizeClass
    var body: some View {
        NavigationView{
            ScrollView{
                NavigationLink(destination: Text("Info Qatar")) {
                    VStack{
                        Spacer()
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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.size.width/4))]){
                    NavigationLink(destination: Text("Squadre")) {
                        VStack{
                            Text("🗺").font(.largeTitle).padding(.top)
                            Text("SQUADRE")
                                .font(.callout)
                                .padding(.bottom)
                        }.frame(width: UIScreen.main.bounds.size.width*115/400,height: UIScreen.main.bounds.size.height*12/60).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2/3)
                        )
                    }.buttonStyle(PlainButtonStyle())
                    NavigationLink(destination: Text("Tabelloni")) {
                        VStack{
                            Text("🏆").font(.largeTitle).padding(.top)
                            Text("TABELLONI")
                                .font(.callout)
                                .padding(.bottom)
                        }.frame(width: UIScreen.main.bounds.size.width*115/400,height: UIScreen.main.bounds.size.height*12/60).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2/3)
                        )
                    }.buttonStyle(PlainButtonStyle())
                    NavigationLink(destination: Text("Calendario")) {
                        VStack{
                            Text("🗓").font(.largeTitle).padding(.top)
                            Text("CALENDARIO").font(.callout).padding(.bottom)
                        }.frame(width: UIScreen.main.bounds.size.width*115/400,height: UIScreen.main.bounds.size.height*12/60).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary, lineWidth: 2/3)
                        )
                    }.buttonStyle(PlainButtonStyle())
                    /*
                    ZStack{
                        RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 2/3)
                        VStack{
                            Text("🗓").font(.largeTitle).padding(.top)
                            Text("CALENDARIO").font(.callout).aspectRatio(contentMode: .fit)
                        }
                        .padding(.bottom)
                    }
                    */
                }
                .padding().frame( width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height/5)
                
            }.navigationBarHidden(true)
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
        Homepage().preferredColorScheme(.dark)
    }
}
