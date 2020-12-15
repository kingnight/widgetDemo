//
//  DiscoverTagList.swift
//  yyyyExtension
//
//  Created by kai jin on 2020/12/15.
//

import Foundation

class DiscoverTagList: NSObject, Codable {
    var items: [DiscoverTag]
}

class DiscoverTag: NSObject, Codable {
    var tagId: String
    var tagName: String
    var hottest: Bool
    var newest: Bool
}
