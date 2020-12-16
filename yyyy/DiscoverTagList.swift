//
//  DiscoverTagList.swift
//  yyyyExtension
//
//  Created by kai jin on 2020/12/15.
//

import Foundation

class DiscoverTagList: NSObject, Codable {
    internal init(items: [DiscoverTag]) {
        self.items = items
    }
    
    var items: [DiscoverTag]
}

class DiscoverTag: NSObject, Codable {
    init(tagId: String, tagName: String, hottest: Bool, newest: Bool) {
        self.tagId = tagId
        self.tagName = tagName
        self.hottest = hottest
        self.newest = newest
    }

    var tagId: String
    var tagName: String
    var hottest: Bool
    var newest: Bool
}
