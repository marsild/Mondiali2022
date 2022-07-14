//
//  AnimazioneCoppa.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 14/07/22.
//

import SwiftUI

struct AnimazioneIniziale: View {
    @Environment(\.verticalSizeClass) var sizeClass
    @State var animazioneTerminata : Bool = false
    @State private var opacity = 1.0
    
    var body: some View {
        if animazioneTerminata {
            Homepage()
        } else {
            VStack {
                VStack {
                    Image("Cup").resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.size.height/5)
                }
                .opacity(opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.opacity = 0.00
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
