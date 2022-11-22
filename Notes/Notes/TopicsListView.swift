//
//  TopicsListView.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct TopicsListView: View {
    var topics: [Topic]
    var body: some View {
        List {
            ForEach(topics) { topic in
                TopicView(topic: topic)
            }
        }
        .navigationTitle("Topics")
        .toolbar {
            Button(action: {
                
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

struct TopicsListView_Previews: PreviewProvider {
    static var topics: [Topic] = Topic.sampleData
    static var previews: some View {
        NavigationView {
            TopicsListView(topics: topics)
        }
    }
}
