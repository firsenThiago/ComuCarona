//
//  UIToast.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 29/11/24.
//

import SwiftUI

enum ToastState {
    case warning
    case error
}

struct UIToast: View {
    var title: String
    var state: ToastState
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: .info)
                .foregroundColor(.basic(.white))
            Text(title)
                .font(.headline)
                .foregroundColor(.basic(.white))
            
        }
        .padding(15)
        .background(currentBackgroundColor)
        .cornerRadius(8)
    }
    
    private var currentBackgroundColor: Color {
        switch state {
        case .warning:
            return .theme(.secondary)
        case .error:
            return .feedback(.error)
        }
    }
}

#Preview {
    VStack {
        UIToast(
            title: "Todas as vagas dessa carona ja foram preechidas! 😥",
            state: .warning
        )
        UIToast(
            title: "Ocorreu problema ao salvar a carona. Por favor, tente novamente!",
            state: .error
        )
    }
    .padding()
}
