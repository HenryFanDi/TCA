//
//  AngelListView.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/10.
//

import SwiftUI

struct AngelListView: View {
    
    let angel: Angel
    
    var body: some View {
        HStack(spacing: 16) {
            HStack {
                Text("\(angel.type.emoji)")
                    .font(.largeTitle)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(angel.name)
                    .font(Font.Lato.bold(size: 24))
                    .foregroundColor(Color.angelListTitle)
                HStack {
                    Text(angel.period)
                        .font(Font.Lato.regular(size: 18))
                        .foregroundColor(Color.angelListSubTitle)
                    Text("/")
                        .font(Font.Lato.regular(size: 18))
                        .foregroundColor(Color.angelListSubTitle)
                    Text(angel.level)
                        .font(Font.Lato.regular(size: 18))
                        .foregroundColor(Color.angelListSubTitle)
                    Spacer()
                }
            }
        }
        .padding(24)
        .background(Color.angelListBackground)
        .cornerRadius(16)
    }
}

struct AngelListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AngelListView(angel: Angel(level: "CP", name: "學姊名字ABC", period: "2010E", type: .angel))
    }
}
