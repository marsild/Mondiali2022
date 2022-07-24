//
//  ViewModel.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 19/07/22.
//

import Foundation
import Firebase

class ViewModel: ObservableObject{
    @Published var list = [Squadra]()
    @Published var listGiocatori = [Giocatore]()
    @Published var isLoaded: Bool = false
    func getData(){
        getSquadre()
        getGiocatori()
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
         */
        self.isLoaded = true
    }
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
    func getGiocatori(){
        //Squadre from json
        let fileName = "players.json"
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
            listGiocatori = try decoder.decode([Giocatore].self, from: data)
            
        } catch {
            fatalError("Error parsing \(fileName) as \([Giocatore].self): \(error)")
        }
    }
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
}
