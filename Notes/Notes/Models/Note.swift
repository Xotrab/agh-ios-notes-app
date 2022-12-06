//
//  Note.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import Foundation

struct Note: Identifiable {
    let id: Int64
    let topicId: Int64
    var content: String
    
    init(id: Int64, content: String, topicId: Int64) {
        self.id = id
        self.content = content
        self.topicId = topicId
    }
}

extension Note {
    static let sampleData: [Note] =
    [
        Note(id: 1, content: "note 1", topicId: 1),
        Note(id: 2, content: "note 2", topicId: 1),
        Note(id: 3, content: "note 3", topicId: 2),
        Note(id: 4, content: "note 4", topicId: 2)
    ]
}

