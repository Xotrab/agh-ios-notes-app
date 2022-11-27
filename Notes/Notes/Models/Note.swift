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
        Note(id: 2, content: "Japap nie wiedzial", topicId: 21),
        Note(id: 1, content: "Kilip galgan niszczy studentom marzenia", topicId: 21),
        Note(id: 3, content: "Gar pod A0 czeka", topicId: 21),
        Note(id: 7, content: "Drip mi przyszedl", topicId: 21)
    ]
}

