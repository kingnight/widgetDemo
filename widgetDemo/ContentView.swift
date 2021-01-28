//
//  ContentView.swift
//  widgetDemo
//
//  Created by kai jin on 2020/12/14.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    let tagId = "486827545673601024"
    let tagName = "直男发言大赏"
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button(action:{
            WidgetCenter.shared.reloadAllTimelines()
        }) {
            Text("Click")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
