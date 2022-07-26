//
//  Partite.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 26/07/22.
//

import Foundation

struct Partita: Identifiable, Codable {
    var id: String
    var casa: String
    var ospite: String
    var data: Date
    var stadio: String
    var golCasa: Int8
    var golOspite: Int8
    var gruppoCasa: String
    var gruppoOspite: String
    var partitaCasa: String
    var partitaOspite: String
}
