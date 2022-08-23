//
//  AnimazioneCoppa.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 14/07/22.
//

import SwiftUI

struct AnimazioneIniziale: View {
    @StateObject var appState = AppState.shared
    @Environment(\.verticalSizeClass) var sizeClass
    @State var animazioneTerminata : Bool = false
    var body: some View {
        if animazioneTerminata {
            Homepage().id(appState.gameID)
        } else {
            VStack {
                VStack {
                    Image("Cup").resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.size.height/5)
                }
            }.transition(.scale(scale: 100))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            self.animazioneTerminata = true
                        }
                    }
                }
        }
    }
}

struct AnimazioneIniziale_Previews: PreviewProvider {
    static var previews: some View {
        AnimazioneIniziale()
    }
}
