//
//  yyyEntryViewProvider.swift
//  widgetDemo
//
//  Created by kai jin on 2021/1/26.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let tagList:DiscoverTagList?
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        
        SimpleEntry(date: Date(),tagList: getTestData())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),tagList: getTestData())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

        let tagList = getTestData()
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
    
    func getTestData() -> DiscoverTagList? {
        let jsonString = """
    {
        "items": [{
            "tagId": "545638899972583424",
            "hottest": false,
            "tagName": "Boss的厨房",
            "newest": false
        }, {
            "tagId": "545286050801520640",
            "hottest": false,
            "tagName": "追光吧哥哥",
            "newest": false
        }, {
            "tagId": "545889775383482369",
            "hottest": false,
            "tagName": "最好笑的谐音梗",
            "newest": true
        }, {
            "tagId": "544555424242741249",
            "hottest": false,
            "tagName": "冬日颜值大赏",
            "newest": false
        }, {
            "tagId": "544125401136373760",
            "hottest": true,
            "tagName": "标签创建大赛",
            "newest": false
        }, {
            "tagId": "545196827075424256",
            "hottest": false,
            "tagName": "年末具有仪式感的事情",
            "newest": false
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
            "tagId": "523800855921569793",
            "hottest": false,
            "tagName": "当代人记忆力有多差",
            "newest": false
        }, {
            "tagId": "542996287641890816",
            "hottest": false,
            "tagName": "如何熬过最艰难的日子",
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
            "tagId": "502415743921430528",
            "hottest": false,
            "tagName": "分享一个撒娇小技巧",
            "newest": false
        }, {
            "tagId": "473056620616630272",
            "hottest": false,
            "tagName": "离婚冷静期",
            "newest": false
        }, {
            "tagId": "541215280668352512",
            "hottest": false,
            "tagName": "绝美明星红毯大赏",
            "newest": false
        }, {
            "tagId": "541202402649321472",
            "hottest": false,
            "tagName": "小时候拥有的天赋",
            "newest": false
        }, {
            "tagId": "538786253093478401",
            "hottest": false,
            "tagName": "校花才艺大比拼",
            "newest": false
        }, {
            "tagId": "495531064211542017",
            "hottest": false,
            "tagName": "一人一句流行梗",
            "newest": false
        }, {
            "tagId": "531512385328918529",
            "hottest": false,
            "tagName": "每天健身半小时",
            "newest": false
        }, {
            "tagId": "540843761601613825",
            "hottest": false,
            "tagName": "追星心动时刻",
            "newest": false
        }, {
            "tagId": "533001422845779969",
            "hottest": false,
            "tagName": "运动美少女养成记",
            "newest": false
        }, {
            "tagId": "486827545673601024",
            "hottest": false,
            "tagName": "直男发言大赏",
            "newest": false
        }, {
            "tagId": "540449886844235777",
            "hottest": false,
            "tagName": "2020年最后一个月",
            "newest": false
        }, {
            "tagId": "540136217950294016",
            "hottest": false,
            "tagName": "我们被爱着的瞬间",
            "newest": false
        }, {
            "tagId": "383526210484846592",
            "hottest": false,
            "tagName": "演员请就位",
            "newest": false
        }, {
            "tagId": "537593651539222528",
            "hottest": false,
            "tagName": "秋冬掠影",
            "newest": false
        }, {
            "tagId": "395515030054903808",
            "hottest": false,
            "tagName": "值得一看的影视剧",
            "newest": false
        }]
    }
    """
        
        var tagList:DiscoverTagList?
        
        do {
            tagList = try JSONDecoder().decode(DiscoverTagList.self, from: jsonString.data(using: .utf8)!)
            return tagList
        } catch let error {
            print(error)
            return nil
        }
    }
}
