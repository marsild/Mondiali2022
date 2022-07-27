//
//  CreaSquadraView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import SwiftUI

struct CreaSquadraView: View {
    @ObservedObject var model: ViewModel
    @Environment(\.verticalSizeClass) var sizeClass
    @State var showAlertHomepage = false
    @State var showAlertRestart = false
    //sharescreenshot
    @State private var showingShareSheet = false
    @State var screenshotMaker: ScreenshotMaker?
    @State var imageShare: UIImage = UIImage()
    //camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    //por
    @State var por = (name: "", emoji: "")
    //def
    @State var dif1 = (name: "", emoji: "")
    @State var dif2 = (name: "", emoji: "")
    @State var dif3 = (name: "", emoji: "")
    @State var dif4 = (name: "", emoji: "")
    //cen
    @State var cen1 = (name: "", emoji: "")
    @State var cen2 = (name: "", emoji: "")
    @State var cen3 = (name: "", emoji: "")
    //for
    @State var att1 = (name: "", emoji: "")
    @State var att2 = (name: "", emoji: "")
    @State var att3 = (name: "", emoji: "")
    //
    @State var ListaPortieri : [Giocatore] = []
    @State var ListaDifensori : [Giocatore] = []
    @State var ListaCentrocampisti : [Giocatore] = []
    @State var ListaAttaccanti : [Giocatore] = []
    var body: some View {
        NavigationView{
            ZStack{
                Image("footballpitch").resizable().frame(maxHeight: UIScreen.main.bounds.size.height).cornerRadius(15).padding(.vertical,2.5).padding(2)
                VStack{
                    HStack(alignment:.center){
                        Text("Allenatore:").foregroundColor(.black)
                        if selectedImage != nil {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "camera.viewfinder")
                                .foregroundColor(.blue)
                        }
                    }.padding(.vertical,1).frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/7).background(Color.green.opacity(0.9)).cornerRadius(10).onTapGesture {
                        self.isImagePickerDisplay.toggle()
                    }
                    VStack{
                        HStack(alignment: .top){
                            circlePlayerView(player: $att1, title: "Attaccanti", ListaGiocatori: self.$ListaAttaccanti, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/3)
                            circlePlayerView(player: $att2, title: "Attaccanti", ListaGiocatori: self.$ListaAttaccanti, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/3)
                            circlePlayerView(player: $att3, title: "Attaccanti", ListaGiocatori: self.$ListaAttaccanti, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/3)
                        }.frame(height: UIScreen.main.bounds.size.height/6).padding(.horizontal)
                        HStack(alignment: .top){
                            circlePlayerView(player: $cen1, title: "Centrocampisti", ListaGiocatori: self.$ListaCentrocampisti, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/3)
                            circlePlayerView(player: $cen2,title: "Centrocampisti", ListaGiocatori: self.$ListaCentrocampisti, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/3)
                            circlePlayerView(player: $cen3,title: "Centrocampisti", ListaGiocatori: self.$ListaCentrocampisti, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/3)
                        }.frame(height: UIScreen.main.bounds.size.height/6).padding(.horizontal)
                        HStack(alignment: .top){
                            circlePlayerView(player: $dif1,title: "Difensori", ListaGiocatori: self.$ListaDifensori, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/4)
                            circlePlayerView(player: $dif2,title: "Difensori", ListaGiocatori: self.$ListaDifensori, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/4)
                            circlePlayerView(player: $dif3, title: "Difensori", ListaGiocatori: self.$ListaDifensori, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/4)
                            circlePlayerView(player: $dif4, title: "Difensori", ListaGiocatori: self.$ListaDifensori, squadre: model.list).frame(maxWidth: UIScreen.main.bounds.size.width/4)
                        }.frame(height: UIScreen.main.bounds.size.height/6).padding(.horizontal)
                        HStack(alignment: .bottom){
                            circlePlayerView(player: $por, title: "Portieri", ListaGiocatori: self.$ListaPortieri, squadre: model.list)
                        }.frame(height: UIScreen.main.bounds.size.height/6, alignment: .center).padding(.bottom,5)
                    }
                }.padding(.vertical,5)
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Crea la tua squadra").toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        if isModified(){
                            showAlertHomepage = true
                        } else {
                            withAnimation{
                                AppState.shared.gameID = UUID()
                            }
                        }
                    } label:{
                        Label("home", systemImage: "house")
                    }.alert("Sicuro di voler tornare nella homepage?", isPresented: $showAlertHomepage){
                        Button("Annulla", role: .cancel){
                            showAlertHomepage = false
                        }
                        Button("Continua", role: .destructive){
                            withAnimation{
                                AppState.shared.gameID = UUID()
                            }
                        }
                    } message : {
                        Text("Cliccando su 'Continua', tutte le modifiche attuali andranno perse")
                    }
                    Button{
                        if isModified(){
                            showAlertRestart = true
                        }
                    } label:{
                        Label("restart", systemImage: "arrow.counterclockwise")
                    }.alert("Sicuro di voler ricominciare?", isPresented: $showAlertRestart){
                        Button("Annulla", role: .cancel){
                            showAlertRestart = false
                        }
                        Button("Continua", role: .destructive){
                            refresh()
                        }
                    } message : {
                        Text("Cliccando su 'Continua', tutte le modifiche attuali andranno perse")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        if let screenshotMaker = screenshotMaker {
                            imageShare = screenshotMaker.screenshot()!
                            self.showingShareSheet = true
                        }
                    } label:{
                        Label("share", systemImage: "square.and.arrow.up")
                    }
                }
            }.screenshotView { screenshotMaker in
                self.screenshotMaker = screenshotMaker
            }.sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage)
            }.sheet(isPresented: $showingShareSheet){
                [imageShare] in
                ActivityView(activityItems: [imageShare] as [Any], applicationActivities: nil)
            }
        }.onAppear{
            refresh()
        }
    }
    func isModified() -> Bool{
        if self.por == (name: "", emoji: "") && self.dif1 == (name: "", emoji: "") && self.dif2 == (name: "", emoji: "") && self.dif3 == (name: "", emoji: "") && self.dif4 == (name: "", emoji: "") && self.cen1 == (name: "", emoji: "") && self.cen2 == (name: "", emoji: "") && self.cen3 == (name: "", emoji: "") && self.att1 == (name: "", emoji: "") && self.att2 == (name: "", emoji: "") && self.att3 == (name: "", emoji: "") && self.selectedImage == nil {
            return false
        } else {
            return true
        }
    }
    func refresh(){
        self.ListaPortieri = model.listaPortieri()
        self.ListaDifensori = model.listaDifensori()
        self.ListaCentrocampisti = model.listaCentrocampisti()
        self.ListaAttaccanti = model.listaAttaccanti()
        self.por = (name: "", emoji: "")
        self.dif1 = (name: "", emoji: "")
        self.dif2 = (name: "", emoji: "")
        self.dif3 = (name: "", emoji: "")
        self.dif4 = (name: "", emoji: "")
        self.cen1 = (name: "", emoji: "")
        self.cen2 = (name: "", emoji: "")
        self.cen3 = (name: "", emoji: "")
        self.att1 = (name: "", emoji: "")
        self.att2 = (name: "", emoji: "")
        self.att3 = (name: "", emoji: "")
        self.selectedImage = nil
    }
}
/*
 struct CreaSquadraView_Previews: PreviewProvider {
 static var previews: some View {
 CreaSquadraView()
 }
 }*/
