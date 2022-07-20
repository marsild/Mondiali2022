//
//  CompressedGironeView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 20/07/22.
//

import SwiftUI
/*
 squadre = model.list.filter({ squadra in
 squadra.gruppo == numerogruppo
 })
 */
struct CompressedGironeView: View {
    var girone: String
    var squadre: [Squadra]
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 2/3)
            VStack{
                Text("Gruppo \(girone)").font(.title2)
                Divider()
                
                LazyVGrid(columns: columns){
                    ForEach(squadre){ squadra in
                        Text(squadra.emoji).font(.largeTitle)
                    }
                }.padding(.horizontal)
            }
        }
    }
}
/*
 struct CompressedGironeView_Previews: PreviewProvider {
 static var previews: some View {
 CompressedGironeView()
 }
 }*/
