//
//  AngelDetailListView.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/10.
//

import SwiftUI

struct AngelDetailListView: View {
    
    let angelDetail: AngelDetail
    
    var body: some View {
        HStack {
            Text(angelDetail.content)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
            Spacer()
        }
    }
}

struct AngelDetailListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AngelDetailListView(angelDetail: AngelDetail(content: "天使！"))
    }
}
