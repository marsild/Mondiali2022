//
//  AppState.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 16/07/22.
//

import Foundation
class AppState: ObservableObject {
    static let shared = AppState()

    @Published var gameID = UUID()
}
