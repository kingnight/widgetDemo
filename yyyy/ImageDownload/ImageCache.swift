//
//  ImageCache.swift
//  ImageDownloaderView
//
//  Created by kai jin on 2021/1/19.
//

import Foundation
import SwiftUI

protocol ImageCache {
    subscript(_ url:URL) -> UIImage? { get set }
}

struct TemporaryImageCache:ImageCache {
    private let cache = NSCache<NSURL,UIImage>()
    
    subscript(key: URL) -> UIImage? {
        get {
            cache.object(forKey: key as NSURL)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
    
    
}
