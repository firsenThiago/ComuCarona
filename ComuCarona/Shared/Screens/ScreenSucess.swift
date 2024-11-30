//
//  ScreenSucess.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 29/11/24.
//

import SwiftUI

struct ScreenSucess: View {
    var title: String
    var description: String
    var textButton: String
    var action: () -> Void
    
    var body: some View {
        VStack() {
            Image(systemName: .check)
                .font(.system(size: 100))
                .symbolRenderingMode(.monochrome)
                .foregroundColor(.feedback(.success))
                .padding(35)
            
            Text(title)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.text(.title))
                .padding(.bottom, 8)
            
            Text(description)
                .font(.system(size: 16))
                .foregroundColor(.text(.description))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 48)
                .padding(.bottom, 16)
            
            UIButton(
                title: textButton,
                style: .normal,
                state: .normal,
                action: action
            )
        }
    }
}

#Preview {
    ScreenSucess(
        title: "Sua carona foi cancelada!",
        description: "Que pena que você cancelou a carona, mas sempre que precisar, volte! 😁🚗",
        textButton: "Ir para a home"
    ) {
        print("clicado")
    }
    .padding()
}
