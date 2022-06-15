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
        HStack(alignment: .bottom, spacing: 0) {
            Image("bubble_arrow")
                .padding(.bottom, -6)
                .padding(.trailing, -18)
                .foregroundColor(Color.angelListBackground)
            
            HStack {
                Text(angelDetail.content)
                    .font(Font.Lato.regular(size: 18))
                    .foregroundColor(Color.angelListSubTitle)
            }
            .padding()
            .background(Color.angelListBackground)
            .cornerRadius(16)
        }
        .padding(.leading, -8)
    }
}

struct AngelDetailListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AngelDetailListView(angelDetail: AngelDetail(content: "天使！"))
    }
}
