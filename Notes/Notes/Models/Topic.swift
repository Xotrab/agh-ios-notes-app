//
//  Topic.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import Foundation

struct Topic: Identifiable {
    let id: Int64
    var notes: [Note]
    var name: String
    init(id: Int64, name: String, notes: [Note]) {
        self.id = id
        self.notes = notes
        self.name = name
    }
}

extension Topic {
    static let sampleData: [Topic] =
    [
        Topic(id: 21, name: "XD", notes: Note.sampleData),
        Topic(id: 37, name: "lolek", notes: Note.sampleData)
    ]
}
