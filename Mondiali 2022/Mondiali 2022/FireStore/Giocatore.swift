//
//  Giocatore.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 21/07/22.
//

import Foundation
struct Giocatore: Identifiable, Codable {
    var id: String
    var idsquadra: String
    var nazione: String
    var ruolo: String
    var nome: String
}
