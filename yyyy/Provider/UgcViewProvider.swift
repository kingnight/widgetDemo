//
//  UgcViewProvider.swift
//  widgetDemo
//
//  Created by kai jin on 2021/1/26.
//

import WidgetKit
import SwiftUI
import Combine

struct UgcEntry: TimelineEntry {
    let date: Date
    let avatar:UIImage
    let userName:String?
}

var subscriptions = Set<AnyCancellable>()

struct UgcProvider:TimelineProvider {
    
    func placeholder(in context: Context) -> UgcEntry {
        UgcEntry(date: Date(),avatar: UIImage(named: "img_avatar")!,userName: "再不登录就老了")
    }

    func getSnapshot(in context: Context, completion: @escaping (UgcEntry) -> ()) {
        let entry = UgcEntry(date: Date(),avatar: UIImage(named: "img_avatar")!,userName: "再不登录就老了")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<UgcEntry>) -> ()) {
        var entries: [UgcEntry] = []
        var imageData:UIImage?
        
        let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                imageData = $0
                
                let currentDate = Date()
                for hourOffset in 0 ..< 5 {
                    let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                    let entry = UgcEntry(date: entryDate,avatar:imageData ?? UIImage(named: "img_avatar")!,userName: "再不登录就老了22222")
                    entries.append(entry)
                }
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            })
            .store(in: &subscriptions)
    }
}
