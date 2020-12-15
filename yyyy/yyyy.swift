//
//  yyyy.swift
//  yyyy
//
//  Created by kai jin on 2020/12/15.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),tagList: nil)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),tagList: nil)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let jsonString = """
    {
        "items": [{
            "tagId": "412764326395404288",
            "hottest": false,
            "tagName": "双子座流星雨",
            "newest": false
        }, {
            "tagId": "545196827075424256",
            "hottest": false,
            "tagName": "年末具有仪式感的事情",
            "newest": true
        }, {
            "tagId": "536863962969411585",
            "hottest": false,
            "tagName": "你拍到的雪景",
            "newest": false
        }, {
            "tagId": "544633081923903488",
            "hottest": false,
            "tagName": "25岁之后才明白的事",
            "newest": false
        }, {
            "tagId": "536123159670165505",
            "hottest": true,
            "tagName": "21天BetterMe生活类打卡",
            "newest": false
        }, {
            "tagId": "540190027372564481",
            "hottest": false,
            "tagName": "地表最强颜值担当",
            "newest": false
        }, {
            "tagId": "544449301904896001",
            "hottest": false,
            "tagName": "我最期待的一部电影",
            "newest": false
        }, {
            "tagId": "538774446022860800",
            "hottest": false,
            "tagName": "冬日最in穿搭",
            "newest": false
        }, {
            "tagId": "543944566630264833",
            "hottest": false,
            "tagName": "狐友国民校花十强",
            "newest": false
        }, {
            "tagId": "437400014080184321",
            "hottest": false,
            "tagName": "此生最爱拍拍拍",
            "newest": false
        }, {
            "tagId": "411669030873612288",
            "hottest": false,
            "tagName": "双十二来啦",
            "newest": false
        }, {
            "tagId": "543728582669643776",
            "hottest": false,
            "tagName": "你镜头下的冬天",
            "newest": false
        }, {
            "tagId": "459376240848031744",
            "hottest": false,
            "tagName": "强迫症的日常",
            "newest": false
        }, {
            "tagId": "543358837692833793",
            "hottest": false,
            "tagName": "你见过最好看的人",
            "newest": false
        }, {
            "tagId": "543539465721753600",
            "hottest": false,
            "tagName": "狐友国民校花总决赛",
            "newest": false
        }, {
            "tagId": "523800855921569793",
            "hottest": false,
            "tagName": "当代人记忆力有多差",
            "newest": false
        }, {
            "tagId": "320463803068190721",
            "hottest": false,
            "tagName": "王者荣耀",
            "newest": false
        }, {
            "tagId": "333701413878112257",
            "hottest": false,
            "tagName": "迷惑行为大赏",
            "newest": false
        }, {
            "tagId": "537596890003283969",
            "hottest": false,
            "tagName": "美食大侦探",
            "newest": false
        }, {
            "tagId": "537593651539222528",
            "hottest": false,
            "tagName": "秋冬掠影",
            "newest": false
        }, {
            "tagId": "531512385328918529",
            "hottest": false,
            "tagName": "每天健身半小时",
            "newest": false
        }, {
            "tagId": "395515030054903808",
            "hottest": false,
            "tagName": "值得一看的影视剧",
            "newest": false
        }, {
            "tagId": "537594892042379264",
            "hottest": false,
            "tagName": "开黑了同学",
            "newest": false
        }, {
            "tagId": "538722056267632641",
            "hottest": false,
            "tagName": "丁真",
            "newest": false
        }, {
            "tagId": "542808261083009025",
            "hottest": false,
            "tagName": "国民校花我来猜",
            "newest": false
        }]
    }
    """
        var tagList:DiscoverTagList?
        
        do {
            tagList = try JSONDecoder().decode(DiscoverTagList.self, from: jsonString.data(using: .utf8)!)
        } catch let error {
            print(error)
        }
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate,tagList: tagList)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let tagList:DiscoverTagList?
}

struct yyyyEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        VStack{
            HStack{
                Text("狐友热聊")
                    .font(.callout)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                Spacer()
                Image("icon-60")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
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
                let spacing = CGFloat(10.0)
                let gridItem = GridItem(spacing: spacing, alignment:.leading)
                if let items = entry.tagList?.items,let tags = items.prefix(8) {
                    let threeRows = [gridItem,gridItem,gridItem,gridItem]
                    LazyHGrid(rows:threeRows) {
                        ForEach(tags,id:\.tagId) { (item) in
                            TagLineView(item:item)
                                .frame(maxWidth: 150,alignment:.leading)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    Spacer()
                }
            default:
                    Text(entry.date, style: .time)
            }
        }.padding(16)
    }
}

@main
struct yyyy: Widget {
    let kind: String = "yyyy"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            yyyyEntryView(entry: entry)
        }
        .configurationDisplayName("狐友")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct yyyy_Previews: PreviewProvider {
    static var previews: some View {
        yyyyEntryView(entry: SimpleEntry(date: Date(),tagList: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
