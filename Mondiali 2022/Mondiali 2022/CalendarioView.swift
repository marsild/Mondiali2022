//
//  CalendarioView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct CalendarioView: View {
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("calendario")
                }
                Divider()
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Calendario")
        }
    }
}

struct CalendarioView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarioView()
    }
}
