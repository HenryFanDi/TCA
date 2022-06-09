//
//  CalculatorButton.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/9.
//

import SwiftUI

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(
            title: "+",
            size: CGSize(width: 88, height: 88),
            backgroundColorName: "operatorBackground",
            foregroundColor: .white,
            action: { }
        )
    }
}
