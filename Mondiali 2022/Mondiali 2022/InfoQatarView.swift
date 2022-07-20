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
    }
}

struct InfoQatarView_Previews: PreviewProvider {
    static var previews: some View {
        InfoQatarView()
    }
}
