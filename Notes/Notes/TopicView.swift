//
//  TopicView.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct TopicView: View {
    let topic: Topic
    var body: some View {
        HStack() {
            Text(topic.name)
            Spacer()
            //Button(action: {
                
            //}) {
              //  Image(systemName: "trash")
            //}
            
        }
        //.overlay(
          //  RoundedRectangle(cornerRadius: 16)
            //    .stroke(.gray, lineWidth: 4)
        //)
    }
}

struct TopicView_Previews: PreviewProvider {
    static var mockTopic = Topic.sampleData[0]
    static var previews: some View {
        TopicView(topic: mockTopic)
    }
}
