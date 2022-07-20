//
//  GironiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct GironiView: View {
    @Binding var showSidebar: Bool
    @ObservedObject var model = ViewModel()
    @State var seeAll:Bool = false
    var body: some View {
        NavigationView{
            VStack{
                if seeAll{
                    ScrollView{
                        Text("see All")
                    }
                } else {
                    HStack{
                        Label("", systemImage: "chevron.left.circle")
                        
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
        }
    }
    init(showSidebar: Binding<Bool>){
        self._showSidebar = showSidebar
        if !model.isLoaded{
            model.getData()
        }
    }
}

struct GironiView_Previews: PreviewProvider {
    static var previews: some View {
        GironiView(showSidebar: .constant(false))
    }
}
