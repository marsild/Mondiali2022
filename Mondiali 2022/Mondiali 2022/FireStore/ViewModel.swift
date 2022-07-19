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
    
    func getData(){
        let db = Firestore.firestore()
        db.collection("squadre").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return Squadra(id: d.documentID,
                                           nome: d["nome"] as? String ?? "",
                                           emoji: d["emoji"] as? String ?? "",
                                           descrizione: d["descrizione"] as? String ?? "",
                                           gruppo: d["gruppo"] as? Int8 ?? 0,
                                           latitudine: d["latitudine"] as? Double ?? 0,
                                           longitudine: d["longitudine"] as? Double ?? 0)
                        }
                    }
                    
                }
            } else {
                // errore
                print("Errore \(error?.localizedDescription ?? "error")")
            }
        }
    }
    
}
