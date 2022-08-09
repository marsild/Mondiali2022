//
//  Stadio.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 28/07/22.
//

import Foundation

struct Stadio: Identifiable, Codable {
    var id: String
    var nome: String
    var descrizione: String
    var urlFoto: String
    var capacita: String
    var latitudine: Double
    var longitudine: Double
}
