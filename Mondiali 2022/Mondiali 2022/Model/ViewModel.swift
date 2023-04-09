//
//  ViewModel.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 19/07/22.
//

import Foundation
import SwiftUI
class ViewModel: ObservableObject{
    let gironi : Dictionary<Int8, String> = [1: "A",
                                             2: "B",
                                             3: "C",
                                             4: "D",
                                             5: "E",
                                             6: "F",
                                             7: "G",
                                             8: "H"]
    var nomiSquadre: Dictionary<String, String> = [:]
    @Environment(\.verticalSizeClass) var sizeClass
    @Published var list = [Squadra]()
    @Published var listGiocatori = [Giocatore]()
    @Published var listPartite = [Partita]()
    @Published var listStadi = [Stadio]()
    init(){
        self.getData()
        self.loadStadiumImages()
    }
    @Published var stadiumImages: [String: (UIImage, URL)] = [:]
    var data = Optional<Data>(nil)
    let notFoundImage = UIImage(systemName: "multiply.circle")
    func loadImage(url: URL, id: String) {
        DispatchQueue.global(qos: .background).async {
            self.data = try? Data(contentsOf: url)
            
            DispatchQueue.main.async {
                if let imageData = self.data {
                    self.stadiumImages[id] = (UIImage(data: imageData)!, url)
                }
            }
        }
    }
    func loadStadiumImages(){
        for stadio in listStadi {
            loadImage(url: URL(string: stadio.urlFoto)!, id: stadio.id)
        }
    }
    func loadNomiSquadre(){
        for squadra in list{
            nomiSquadre[squadra.id] = squadra.nome
        }
    }
    func getData(){
        list = getType(fileName: "squads.json")
        listGiocatori = getType(fileName: "players.json")
        listPartite = getType(fileName: "matches.json")
        listStadi = getType(fileName: "stadiums.json")
        loadNomiSquadre()
    }
    func getType<T : Codable>(fileName: String) -> [T]{
        var outputArray : [T]
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
        else { fatalError("File \(fileName) not found")}
        let data: Data
        
        do {
            data = try Data(contentsOf: file)
        } catch {
          fatalError("\(fileName) not loaded: \(error)")
        }
        
        let decoder = JSONDecoder()
        
        
        do {
            outputArray = try decoder.decode([T].self, from: data)
        } catch {
            fatalError("Error parsing \(fileName) as \([Squadra].self): \(error)")
        }
        return outputArray
    }
    func giocatoriInSquadra(squadra: String) -> [Giocatore]{
        return self.listGiocatori.filter { giocatore in
            giocatore.idsquadra == squadra
        }.sorted { Giocatore1, Giocatore2 in
            Giocatore1.ruolo > Giocatore2.ruolo
        }
    }
    func squadreInGruppo(gruppo: Int8) -> [Squadra]{
        return self.list.filter({ squadra in
            squadra.gruppo == gruppo
        })
    }
    func listaPortieri() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "P"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    func listaDifensori() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "D"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    func listaCentrocampisti() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "C"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    func listaAttaccanti() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "A"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    func getEmoji(idSquadra: String) -> String {
        list.first { Squadra in
            Squadra.id == idSquadra
        }?.emoji ?? "🏴‍☠️"
    }
    func partiteSquadra(idSquadra: String) -> [Partita]{
        return listPartite.filter { partita in
            partita.casa == idSquadra || partita.ospite == idSquadra
        }
    }
}
