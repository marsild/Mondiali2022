//
//  EliminazioneView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct EliminazioneView: View {
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("eliminazione")
                }
                Divider()
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Eliminazione")
        }
    }
}

struct EliminazioneView_Previews: PreviewProvider {
    static var previews: some View {
        EliminazioneView()
    }
}
