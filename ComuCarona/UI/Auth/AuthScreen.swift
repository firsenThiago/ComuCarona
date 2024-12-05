//
//  Auth.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 04/12/24.
//

import SwiftUI

public struct Auth: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
    public var body: some View {
        VStack(spacing: 38) {
            VStack(spacing: 16) {
                Text("Código de entrada")
                    .font(.system(size: 24))
                Text("Digite o código disponibilizado nas reuniões e no grupo do whatsapp para ter acesso ao aplicativo")
                    .font(.system(size: 16))
            }
            
            UIInputCode(code: $viewModel.code)
            UIButton(
                title: "Verificar Código",
                style: viewModel.styleButton,
                state: viewModel.stateButton
            ) {
                viewModel.submitCode()
            }
        }
        .padding()
        .onChange(of: viewModel.code) { _, _ in
            viewModel.updateButtonState()
        }
    }
}

#Preview {
    Auth(viewModel: AuthViewModel())
}
