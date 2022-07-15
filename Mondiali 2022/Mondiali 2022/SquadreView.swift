//
//  GruppiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct SquadreView: View {
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("squadre")
                }
                Divider()
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Squadre")
        }
    }
}

struct SquadreView_Previews: PreviewProvider {
    static var previews: some View {
        SquadreView()
    }
}
