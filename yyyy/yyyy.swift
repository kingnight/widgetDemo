//
//  yyyy.swift
//  yyyy
//
//  Created by kai jin on 2020/12/15.
//

import WidgetKit
import SwiftUI

@main
struct hyWidget:WidgetBundle {
    var body: some Widget {
        yyyy()
        ugcEntryWidget()
    }
}


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

struct ugcEntryWidget:Widget {
    let kind: String = "ugc"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: UgcProvider()) { entry in
            ugcEntryView(entry: entry)
        }
        .configurationDisplayName("狐友")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

