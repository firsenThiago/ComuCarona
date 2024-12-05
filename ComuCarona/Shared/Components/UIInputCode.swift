//
//  UIInputCode.swift
//  ComuCarona
//
//  Created by Thiago Firsen on 04/12/24.
//


import SwiftUI

struct UIInputCode: View {
    @Binding var code: [String]
    @FocusState private var focusedField: Int?
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(0..<5, id: \.self) { index in
                TextField("", text: $code[index])
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 40, height: 50)
                    .background(Color.basic(.white))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.1),
                                    lineWidth: 2)
                    )
                    .focused($focusedField, equals: index)
                    .onChange(of: code[index]) {_, newValue in
                        if newValue.count > 1 {
                            code[index] = String(newValue.prefix(1))
                        }
                        if !newValue.isEmpty && index < 4 {
                            focusedField = index + 1
                        }
                    }
            }
        }
        .onAppear {
            focusedField = 0
        }
    }
}

struct UIInputCodePreview: View {
    @State private var code: [String] = Array(repeating: "", count: 5)
    
    var completeCode: String {
        code.joined()
    }
    
    var body: some View {
        VStack {
            Text("Enter Verification Code")
                .font(.headline)
                .padding()
            
            UIInputCode(code: $code)
            
            Spacer()
            
            Button("Submit") {
                print("Submitted code: \(completeCode)")
            }
            .padding()
        }
    }
}

#Preview {
    UIInputCodePreview()
}
