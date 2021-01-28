//
//  AsyncImage.swift
//  ImageDownloaderView
//
//  Created by kai jin on 2021/1/19.
//

import Foundation
import SwiftUI

struct AsyncImage<Placeholder:View>:View {
    @StateObject private var loader:ImageLoader
    private let placeholder:Placeholder
    private let image: (UIImage) -> Image

    init(url:URL,
         @ViewBuilder placeholder:() -> Placeholder,
         @ViewBuilder image:@escaping (UIImage) -> Image = Image.init(uiImage:)
    
    ) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url,cache: Environment(\.imageCache).wrappedValue))
        self.image = image
    }
    
    var body: some View{
        content.onAppear(perform:loader.load)
    }
    
    private var content:some View {
        Group{
            if loader.image != nil{
                image(loader.image!)
            }
            else{
                placeholder
            }
        }
    }
}



