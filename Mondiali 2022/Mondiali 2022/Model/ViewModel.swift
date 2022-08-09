//
//  ViewModel.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 19/07/22.
//

import Foundation
import Firebase
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
    //WWWWWWW var imageLoader = ImageLoader()
    init(){
        self.getData()
        self.loadStadiumImages()
    }
    //wwwwww
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
    //qwwwwww
    func getData(){
        list = getType(fileName: "squads.json")
        listGiocatori = getType(fileName: "players.json")
        listPartite = getType(fileName: "matches.json")
        listStadi = getType(fileName: "stadiums.json")
        loadNomiSquadre()
        /*
        let db = Firestore.firestore()
        db.collection("squadre").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    //DispatchQueue.main.async {
                    self.list = snapshot.documents.map { d in
                        return Squadra(id: d.documentID,
                                       nome: d["nome"] as? String ?? "",
                                       emoji: d["emoji"] as? String ?? "",
                                       descrizione: d["descrizione"] as? String ?? "",
                                       gruppo: d["gruppo"] as? Int8 ?? 0,
                                       latitudine: d["latitudine"] as? Double ?? 0,
                                       longitudine: d["longitudine"] as? Double ?? 0)
                    }
                    //}
                }
            } else {
                // errore
                print("Errore Squadre \(error?.localizedDescription ?? "error squadre")")
            }
        }
        db.collection("giocatori").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    //DispatchQueue.main.async {
                    self.listGiocatori = snapshot.documents.map { d in
                        return Giocatore(id: d.documentID,
                                         idsquadra: d["idsquadra"] as? String ?? "",
                                         nazione: d["nazione"] as? String ?? "",
                                         ruolo: d["ruolo"] as? String ?? "",
                                         nome: d["nome"] as? String ?? "")
                    }
                    //}
                }
            } else {
                // errore
                print("Errore giocatori \(error?.localizedDescription ?? "error giocatori")")
            }
        }
         db.collection("partite").getDocuments { snapshot, error in
             if error == nil {
                 if let snapshot = snapshot {
                     self.listPartite = snapshot.documents.map { d in
                         return Partita(id: d.documentID,
                                        casa: d["casa"] as? String ?? "",
                                        ospite: d["state"] as? String ?? "",
                                        data: (d["data"] as? Timestamp ?? Timestamp()).dateValue(),
                                        stadio: d["stadio"] as? String ?? "",
                                        golCasa: d["golCasa"] as? Int8 ?? 0,
                                        golOspite: d["golOspite"] as? Int8 ?? 0,
                                        gruppoCasa: d["gruppoCasa"] as? String ?? "",
                                        gruppoOspite: d["gruppoOspite"] as? String ?? "",
                                        partitaCasa: d["partitaCasa"] as? String ?? "",
                                        partitaOspite: d["partitaOspite"] as? String ?? "")
                     }
                 }
             } else {
                 // errore
                 print("Errore Partite \(error?.localizedDescription ?? "error partite")")
             }
         }
         db.collection("stadi").getDocuments { snapshot, error in
             if error == nil {
                 if let snapshot = snapshot {
                     //DispatchQueue.main.async {
                     self.listStadi = snapshot.documents.map { d in
                         return Stadio(id: d.documentID,
                                       nome: d["nome"] as? String ?? "",
                                       descrizione: d["descrizione"] as? String ?? "",
                                       urlFoto: d["urlFoto"] as? String ?? "",
                                       capacita: d["capacita"] as? String ?? "",
                                       latitudine: d["latitudine"] as? Double ?? 0,
                                       longitudine: d["longitudine"] as? Double ?? 0)
                     }
                     //}
                 }
             } else {
                 // errore
                 print("Errore Squadre \(error?.localizedDescription ?? "error squadre")")
             }
         }
         */
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
    /*
    func getSquadre(){
        //Squadre from json
        let fileName = "squads.json"
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
            list = try decoder.decode([Squadra].self, from: data)
            
        } catch {
            fatalError("Error parsing \(fileName) as \([Squadra].self): \(error)")
        }
    }
   */
    /*
    func jsonPrintSquads(){
        let pathDirectory = getDocumentsDirectory()
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let filePath = pathDirectory.appendingPathComponent("squads.json")

        let json = try? JSONEncoder().encode(list)
        print(filePath)
        do {
             try json!.write(to: filePath)
            print("done")
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }

        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    }
    func jsonPrintPlayers(){
    
        let pathDirectory = getDocumentsDirectory()
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let filePath = pathDirectory.appendingPathComponent("players.json")

        let json = try? JSONEncoder().encode(listGiocatori)

        do {
             try json!.write(to: filePath)
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }

        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    }
    func jsonPrintMatches(){
    
        let pathDirectory = getDocumentsDirectory()
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let filePath = pathDirectory.appendingPathComponent("matches.json")
        print(filePath.absoluteString)
        let json = try? JSONEncoder().encode(listPartite)

        do {
             try json!.write(to: filePath)
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }

        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    }
     func jsonPrintStadiums(){
         let pathDirectory = getDocumentsDirectory()
         try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
         let filePath = pathDirectory.appendingPathComponent("stadiums.json")

         let json = try? JSONEncoder().encode(listStadi)
         print(filePath)
         do {
              try json!.write(to: filePath)
             print("done")
         } catch {
             print("Failed to write JSON data: \(error.localizedDescription)")
         }

         func getDocumentsDirectory() -> URL {
             let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
             return paths[0]
         }
     }
    */
    //func1
    func giocatoriInSquadra(squadra: String) -> [Giocatore]{
        return self.listGiocatori.filter { giocatore in
            giocatore.idsquadra == squadra
        }.sorted { Giocatore1, Giocatore2 in
            Giocatore1.ruolo > Giocatore2.ruolo
        }
    }
    //func2
    func squadreInGruppo(gruppo: Int8) -> [Squadra]{
        return self.list.filter({ squadra in
            squadra.gruppo == gruppo
        })
    }
    //func
    func listaPortieri() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "P"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    //func
    func listaDifensori() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "D"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    //func
    func listaCentrocampisti() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "C"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    //func
    func listaAttaccanti() -> [Giocatore]{
        return self.listGiocatori.filter({ g in
            g.ruolo == "A"
        }).sorted { giocatore1, giocatore2 in
            giocatore1.idsquadra < giocatore2.idsquadra
        }
    }
    //func
    func getEmoji(idSquadra: String) -> String {
        list.first { Squadra in
            Squadra.id == idSquadra
        }?.emoji ?? "🏴‍☠️"
    }
}