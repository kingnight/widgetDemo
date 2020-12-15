//
//  TagLineView.swift
//  yyyyExtension
//
//  Created by kai jin on 2020/12/15.
//

import SwiftUI


struct TagLineView: View {
    var item: DiscoverTag
    
    var body: some View {
        HStack(alignment: .top){
            Text(item.tagName)
                .font(.caption2)
                .lineLimit(1)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            if item.hottest {
                Image("ic_hot_normal")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            else if item.newest {
                Image("ic_newchinese_normal")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            
        }
        .widgetURL(URL(string: ""))
    }
}
