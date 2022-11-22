//
//  Note.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import Foundation

struct Note: Identifiable {
    let id: UUID
    var content: String
    
    init(id: UUID = UUID(), content: String) {
        self.id = id
        self.content = content
    }
}

extension Note {
    static let sampleData: [Note] =
    [
        Note(content: "Japap nie wiedzial"),
        Note(content: "Kilip galgan niszczy studentom marzenia"),
        Note(content: "Gar pod A0 czeka"),
        Note(content: "Drip mi przyszedl")
    ]
}

