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
    @State var listView = false
    var formatter = DateFormatter()
    @State var date = Date()
    init(showSidebar: Binding<Bool>){
        self._showSidebar = showSidebar
        formatter.locale = Locale(identifier: "it")
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        self.date = Date()
    }
    var body: some View {
        NavigationView{
            VStack{
                if(listView){
                    VStack{
                        Text("list")
                    }
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
                    ScrollView{
                        Text(formatter.string(from: date))
                    }.onAppear{
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
        CalendarioView(showSidebar: .constant(false))
    }
}
