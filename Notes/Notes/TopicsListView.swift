//
//  TopicsListView.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct TopicsListView: View {
    @State var newTopicName: String = ""
    @State var isPresentingNewTopicView: Bool = false
    let database: DatabaseService?
    @State var topics: [Topic]
    
    func delete(at offsets: IndexSet) {
        let index = offsets.first
        do {
            try self.database?.deleteTopic(id: self.topics[index!].id)
            self.topics.remove(atOffsets: offsets)
        }
        catch {
            print(error)
        }
    }
    
    init(database: DatabaseService) {
        self.database = database
        do  {
            self.topics = try self.database!.getTopics()
        }
        catch {
            self.topics = Topic.sampleData
        }
    }
    
    init(topics: [Topic]) {
        self.topics = topics
        self.database = nil
    }
    
    var body: some View {
        List {
            ForEach(topics) { topic in
                NavigationLink(destination: NotesListView(database: self.database, topicId: topic.id)) {
                    TopicView(topic: topic)
                }
            }.onDelete(perform: delete)
        }
        .navigationTitle("Topics")
        .toolbar {
            Button(action: {
                isPresentingNewTopicView = true
            }) {
                Image(systemName: "plus")
            }.disabled(self.topics.count >= 25)
        }
        .sheet(isPresented: $isPresentingNewTopicView) {
            NavigationView {
                AddTopicView(name: $newTopicName)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewTopicView = false
                                newTopicName = ""
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                do {
                                    let topic = try self.database?.addTopic(name: self.newTopicName)
                                    self.topics.append(topic!)
                                } catch {
                                    print(error)
                                }
                                isPresentingNewTopicView = false
                                newTopicName = ""
                            }
                        }
                    }
            }
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
