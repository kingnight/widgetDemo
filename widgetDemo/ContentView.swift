//
//  ContentView.swift
//  widgetDemo
//
//  Created by kai jin on 2020/12/14.
//

import SwiftUI

struct ContentView: View {
    let tagId = "486827545673601024"
    let tagName = "直男发言大赏"
    var body: some View {
        print("https://applinks.w.sohu.com/tag?tagId=\(tagId)&tagName=\(tagName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        return Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
