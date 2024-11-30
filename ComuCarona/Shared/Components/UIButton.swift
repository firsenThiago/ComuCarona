//
//  Button.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 22/11/24.
//

import SwiftUI

/// Enum - Button States
enum ButtonState {
    case normal
    case success
    case disabled
    case loading
}

/// Enum - Button Styles
enum ButtonStyleType {
    case normal
    case disabled
    case custom(foregroundColor: Color, backgroundColor: Color)
}

struct UIButton: View {
    var title: String
    var style: ButtonStyleType = .normal
    var state: ButtonState = .normal
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            if state == .normal || state == .success {
                action?()
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(currentBackgroundColor)
                    .frame(height: 56)
                
                ButtonContent
            }
        }
        .disabled(state == .disabled || state == .loading || state == .success)
    }
    
    /// Text Color
    private var currentForegroundColor: Color {
        switch style {
        case .disabled:
            return .basic(.white)
        case .custom(let foregroundColor, _):
            return foregroundColor
        default:
            return .basic(.white)
        }
    }
    
    /// BackGround Color
    private var currentBackgroundColor: Color {
        switch style {
        case .disabled:
            return .background(.disabledBackground)
        case .custom(_, let backgroundColor):
            return backgroundColor
        default:
            switch state {
            case .success:
                return .feedback(.success)
            default:
                return .theme(.primary)
            }
        }
    }
    
    /// Button Content based on State
    @ViewBuilder
    private var ButtonContent: some View {
        if state == .loading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .tint(currentForegroundColor)
        } else if state == .success {
            Image(systemName: "checkmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(currentForegroundColor)
        } else {
            Text(title)
                .font(.headline)
                .foregroundColor(currentForegroundColor)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        UIButton(
            title: "Quero essa carona!",
            style: .normal,
            state: .normal
        ) {
            // Nenhuma ação
        }
        
        UIButton(
            title: "",
            style: .custom(foregroundColor: .white, backgroundColor: .theme(.primary)),
            state: .loading
        ) {
            // Nenhuma ação
        }
        
        UIButton(
            title: "Quero essa carona",
            style: .disabled,
            state: .disabled
        ) {
            // Nenhuma ação
        }
        
        UIButton(
            title: "Quero essa carona",
            style: .normal,
            state: .success
        ) {
            // Nenhuma ação
        }
        
        UIButton(
            title: "Cancelar carona",
            style: .custom(foregroundColor: .feedback(.error), backgroundColor: .basic(.white)),
            state: .normal
        ) {
            // Nenhuma ação
        }
    }
    .padding()
}
