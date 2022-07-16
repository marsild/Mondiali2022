//
//  InfoQatarView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct InfoQatarView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            Divider()
            ScrollView{
                Text("Info Qatar")
            }
        }.navigationTitle("Qatar 2022")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
              leading: Button(action: { presentation.wrappedValue.dismiss() }) {
                Image(systemName: "chevron.left")
                  .foregroundColor(.blue)
                  .imageScale(.large) })
            .contentShape(Rectangle()) // Start of the gesture to dismiss the navigation
            .gesture(
              DragGesture(coordinateSpace: .local)
                .onEnded { value in
                  if value.translation.width > 100 {
                    presentation.wrappedValue.dismiss()
                  }
                }
            )
    }
}

struct InfoQatarView_Previews: PreviewProvider {
    static var previews: some View {
        InfoQatarView()
    }
}
