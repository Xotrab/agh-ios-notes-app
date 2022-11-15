//
//  Topic.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import Foundation

struct Topic: Identifiable {
    let id: UUID
    var notes: [Note]
    var name: String
    init(id: UUID = UUID(), name: String, notes: [Note]) {
        self.id = id
        self.notes = notes
        self.name = name
    }
}
