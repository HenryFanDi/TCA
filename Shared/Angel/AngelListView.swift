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
        VStack(alignment: .leading) {
            Text(angel.name)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
            HStack {
                Text("\(angel.type.emoji)")
                    .font(.title3)
                    .foregroundColor(Color.red)
                Spacer()
                Text(angel.period)
                    .font(.title3)
                Text(angel.level)
                    .font(.title3)
            }
        }
    }
}

struct AngelListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AngelListView(angel: Angel(level: "CP", name: "學姊", period: "2010E", type: .angel))
    }
}
