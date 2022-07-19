//
//  Squadra.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 19/07/22.
//

import Foundation

struct Squadra: Identifiable {
    var id: String
    var nome: String
    var emoji: String
    var descrizione: String
    var gruppo: Int8
    var latitudine: Double
    var longitudine: Double
}
