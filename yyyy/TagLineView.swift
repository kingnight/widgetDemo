//
//  TagLineView.swift
//  yyyyExtension
//
//  Created by kai jin on 2020/12/15.
//

import SwiftUI
import WidgetKit

struct TagLineView: View {
    var item: DiscoverTag
    
    var body: some View {
        print("https://applinks.w.sohu.com/tag?tagId=\(item.tagId)&tagName=\(item.tagName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        return Link(destination: URL(string: "https://applinks.w.sohu.com/tag?tagId=\(item.tagId)&tagName=\(item.tagName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!, label: {
            HStack(alignment: .top){
//                Text(item.tagName)
//                    .font(.caption)
//                    .fontWeight(.regular)
//                    .lineLimit(1)
                Text("https://applinks.w.sohu.com/tag?tagId=\(item.tagId)&tagName=\(item.tagName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
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
                Spacer()
            }
        })
    }
}


struct TagLineView_Previews: PreviewProvider {
    static var previews: some View {
        TagLineView(item: DiscoverTag(tagId: "333333", tagName: "djfkjkj333333", hottest: true, newest: false))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
