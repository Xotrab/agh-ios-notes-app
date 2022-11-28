//
//  DatabaseService.swift
//  Notes
//
//  Created by user229941 on 11/27/22.
//

import Foundation
import SQLite

class DatabaseService {
    var mockNotes = Note.sampleData
    var mockTopics = Topic.sampleData
    let topics: TopicsTable
    let notes: NotesTable
    let db: Connection
    
    init() throws {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        self.db = try Connection("\(path)/db.sqlite3")
        
        self.topics = try TopicsTable(db: self.db)
        self.notes = try NotesTable(db: self.db, topicsTable: topics)
    }
    
    func getNotesForTopic(topicId: Int64) throws -> [Note] {
        return try self.notes.select(db: self.db, topicId: topicId)
    }
    
    func getTopics() throws -> [Topic] {
        return try self.topics.select(db: self.db)
    }
    
    func addNote(content: String, topicId: Int64) throws -> Note {
        
        return try self.notes.insert(db: self.db, content: content, topicId: topicId)
    }

    func addTopic(name: String) throws -> Topic {
        return try self.topics.insert(db: self.db, name: name)
    }
    
}
