//
//  AuthViewModel.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 04/12/24.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var code: [String] = Array(repeating: "", count: 5)
    @Published var stateButton: ButtonState = .disabled
    @Published var styleButton: ButtonStyleType = .disabled
    
    var completeCode: String {
        return code.joined()
    }
    
    func updateButtonState() {
        if completeCode.count == 5 {
            stateButton = .normal
            styleButton = .normal
        } else {
            stateButton = .disabled
            styleButton = .disabled
        }
    }
    
    func setCustomButtonState(state: ButtonState, style: ButtonStyleType) {
        stateButton = state
        styleButton = style
    }
    
    func submitCode() {
        setCustomButtonState(state: .loading, style: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stateButton = .success
            print("Submitted code: \(self.completeCode)")
        }
    }
}

