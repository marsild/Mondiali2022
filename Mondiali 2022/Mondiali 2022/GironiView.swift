//
//  GironiView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 15/07/22.
//

import SwiftUI

struct GironiView: View {
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    Text("gironi")
                }
                Divider()
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Gironi")
        }
    }
}

struct GironiView_Previews: PreviewProvider {
    static var previews: some View {
        GironiView()
    }
}
