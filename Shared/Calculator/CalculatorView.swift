//
//  CalculatorView.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/9.
//

import SwiftUI

struct CalculatorView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .trailing
                )
            
            CalculatorButtonPad()
                .padding(.bottom)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
        CalculatorView().previewDevice("iPhone SE (3rd generation)")
        CalculatorView().previewDevice("iPad Pro (9.7-inch)")
    }
}
