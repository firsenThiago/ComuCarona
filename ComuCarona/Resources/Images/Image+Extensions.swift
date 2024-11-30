//
//  Imag.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 30/11/24.
//

import SwiftUI

extension Image {
    init(systemName symbol: Symbol) {
        self.init(systemName: symbol.rawValue)
    }
}
