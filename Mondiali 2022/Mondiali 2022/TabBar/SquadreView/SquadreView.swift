//
//  GruppiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct SquadreView: View {
    @Binding var showSidebar: Bool
    @ObservedObject var model: ViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(model.list.sorted(by: {$0.nome < $1.nome})){ squadra in
                        NavigationLink(destination: SingolaSquadraView(latitudine: squadra.latitudine, longitudine: squadra.longitudine, emoji: squadra.emoji, nome: squadra.nome, descrizione: squadra.descrizione, id: squadra.id, model: model)){
                            ZStack{
                                RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 2/3)
                                VStack{
                                    Text(squadra.emoji).font(.largeTitle).padding(.top)
                                    Text(squadra.nome).font(.callout).minimumScaleFactor(0.01).padding(.horizontal).aspectRatio(contentMode: .fit)
                                }
                                .padding(.bottom)
                            }.aspectRatio(1, contentMode: .fit)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.all, 5.0)
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Squadre")
                .toolbar {
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
        }
    }
}
/*
struct SquadreView_Previews: PreviewProvider {
    static var previews: some View {
        SquadreView(showSidebar: .constant(false))
    }
}*/
