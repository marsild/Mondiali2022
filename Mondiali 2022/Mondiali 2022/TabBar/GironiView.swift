//
//  GironiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct GironiView: View {
    @Binding var showSidebar: Bool
    @ObservedObject var model: ViewModel
    @State var seeAll:Bool = false
    @State var girone:Int8 = 1
    @State var startPos : CGPoint = .zero
    @State var isSwipping = true
    
    let gironi : Dictionary<Int8, String> = [1: "A",
                                             2: "B",
                                             3: "C",
                                             4: "D",
                                             5: "E",
                                             6: "F",
                                             7: "G",
                                             8: "H"]
    var body: some View {
        NavigationView{
            VStack{
                if seeAll{
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(gironi.sorted(by: <), id: \.key) { key, value in
                                CompressedGironeView(girone: value, squadre: model.squadreInGruppo(gruppo: key)).aspectRatio(1, contentMode: .fit).onTapGesture {
                                    withAnimation{
                                        self.seeAll.toggle()
                                    }
                                    self.girone = key
                                }.padding(5)
                            }
                        }.padding(5)
                    }
                } else {
                    HStack{
                        Button{
                            self.girone = self.girone - 1
                        } label: {
                            Label("", systemImage: "chevron.left.circle")
                        }.disabled(girone==1 ? true : false).padding(.horizontal)
                        SingleGironeView(girone: gironi[girone]!, gruppo: self.girone, model: model).aspectRatio(1, contentMode: .fit).frame(maxHeight: UIScreen.main.bounds.size.height*6/10)
                        Button{
                            self.girone = self.girone + 1
                        } label: {
                            Label("", systemImage: "chevron.right.circle")
                        }.disabled(girone==8 ? true : false).padding(.horizontal)
                    }
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Gironi").toolbar {
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
                    Button{
                        self.seeAll.toggle()
                    } label:{
                        if !seeAll{
                            Label("seeAll", systemImage: "square.grid.2x2")
                        } else {
                            Label("seeSingle", systemImage: "square")
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
                let xDist =  abs(gesture.location.x - self.startPos.x)
                let yDist =  abs(gesture.location.y - self.startPos.y)
                if self.startPos.x > gesture.location.x && yDist < xDist {
                    if(self.girone < 8){
                        self.girone = self.girone + 1
                    }
                }
                else if self.startPos.x < gesture.location.x && yDist < xDist {
                    if(self.girone > 1){
                        self.girone = self.girone - 1
                    }
                }
                self.isSwipping.toggle()
            }
        )
    }
    init(showSidebar: Binding<Bool>, model: ViewModel){
        self._showSidebar = showSidebar
        self.model = model
        if !model.isLoaded{
            model.getData()
        }
    }
}

/*struct GironiView_Previews: PreviewProvider {
 static var previews: some View {
 GironiView(showSidebar: .constant(false))
 }
 }*/
