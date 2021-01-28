//
//  ugcEntryView.swift
//  yyyyExtension
//
//  Created by kai jin on 2021/1/26.
//

import WidgetKit
import SwiftUI

struct ugcEntryView: View {
    var entry: UgcProvider.Entry
    @Environment(\.widgetFamily) var family
    
    static let taskDateFormat:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        return formatter
    }()
    
    var body: some View {
        ZStack{
            Image("background").resizable().scaledToFit()
            
            VStack{
                HStack{
                    Image(uiImage: entry.avatar)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 32, height: 32, alignment: .center)
                    
                    Text(entry.userName ?? "再不登录就老了")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .lineLimit(1)
//                        .foregroundColor(Color("userNameColor"))
                    
                    Spacer()
                }
                
                ZStack{
                    Color.white
                    HStack(alignment: .center){
                        Image("pencil").resizable().frame(width: 18, height: 18)
                        Text("分享有趣的事")
                            .foregroundColor(Color("shareTextColor"))
                    }
                }.frame(width: 288, height: 56)
                .cornerRadius(5)
                
                HStack{
                    Spacer()
                    Text(entry.date,style: Text.DateStyle.date)
                }
            }
            .padding(EdgeInsets(top: 18, leading: 20, bottom: 14, trailing: 20))
        }
    }
}

struct ugcEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ugcEntryView(entry: UgcEntry(date: Date(), avatar: UIImage(named: "img_avatar")!, userName: "再不登录就老了"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        ugcEntryView(entry: UgcEntry(date: Date(), avatar: UIImage(named: "img_avatar")!, userName: "再不登录就老了"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .environment(\.colorScheme, .dark)
            
    }
}
