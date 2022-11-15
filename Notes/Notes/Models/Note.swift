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

