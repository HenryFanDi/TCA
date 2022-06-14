//
//  AngelDetailView.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/10.
//

import SwiftUI

struct AngelDetailView: View {
    
    let angel: Angel
    
    let angelDetails: [AngelDetail]
    
    var body: some View {
        VStack {
            Text(angel.name)
                .font(.title)
            List(angelDetails) { angelDetail in
                AngelDetailListView(angelDetail: angelDetail)
            }
        }
    }
}

struct AngelDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        AngelDetailView(
            angel: Angel(level: "CP", name: "學姊", type: .angel),
            angelDetails: [
                AngelDetail(content: "天使！"),
                AngelDetail(content: "天使！"),
                AngelDetail(content: "天使！")
            ]
        )
    }
}
