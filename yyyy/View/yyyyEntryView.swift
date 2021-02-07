//
//  yyyyEntryView.swift
//  yyyyExtension
//
//  Created by kai jin on 2021/1/26.
//

import WidgetKit
import SwiftUI

struct yyyyEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        VStack{
            HStack{
                Text("狐友热聊")
                    .font(.title2)
                Spacer(minLength: 100)
                Image("icon-60")
                    .resizable()
                    .frame(width: 37, height: 37)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            switch family {
                case .systemSmall:
                    VStack(alignment: .leading){
                        if let items = entry.tagList?.items,let tags = items.prefix(4) {
                            ForEach(tags,id:\.tagId) { (item) in
                                TagLineView(item: item)
                            }
                        }
                    }
            case .systemMedium:
                let spacing = CGFloat(12.0)
                let gridItem = GridItem(.flexible(minimum: 10, maximum: 15),spacing: spacing, alignment:.leading)
                if let items = entry.tagList?.items,let tags = items.prefix(6) {
                    let threeRows = [gridItem,gridItem,gridItem]
                    GeometryReader(content: { geometry in
                        LazyHGrid(rows:threeRows,alignment:.top, spacing:14) {
                            ForEach(tags,id:\.tagId) { (item) in
                                TagLineView(item:item)
                                    .frame(width: geometry.size.width/2, alignment: .leading)
                            }
                        }
                    })
                    
                }
            default:
                    Text(entry.date, style: .time)
            }
        }
        .padding(EdgeInsets(top: 19, leading: 14, bottom: 18, trailing: 14))
    }
}

struct yyyyEntryView_Previews: PreviewProvider {
    static var previews: some View {
        let tagArr = [DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false),
                      DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false),
                      DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false),
                      DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false),
                      DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false),
                      DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false),
                      DiscoverTag(tagId: "11111111", tagName: "3333333333", hottest: true, newest: false)
        ]
        yyyyEntryView(entry: SimpleEntry(date: Date(),tagList: DiscoverTagList(items: tagArr)))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
