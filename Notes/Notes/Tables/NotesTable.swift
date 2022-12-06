import Foundation
import SQLite

class NotesTable {
    let id = Expression<Int64>("id")
    let topicId = Expression<Int64?>("topicId")
    let content = Expression<String>("content")
    
    let table = Table("notes")
    
    init(db: Connection, topicsTable: TopicsTable) throws {
        try db.run(table.create(ifNotExists:true) {t in
            t.column(id, primaryKey: .autoincrement)
            t.column(topicId, references: topicsTable.table, topicsTable.id)
            t.column(content)
        })
    }
    
    func insert(db: Connection, content: String, topicId: Int64) throws -> Note {
        let id = try db.run(table.insert(self.content <- content, self.topicId <- topicId))
        return Note(id: id, content: content, topicId: topicId)
    }
    
    func select(db: Connection, topicId: Int64) throws -> [Note] {
        var notes: [Note] = []
        for note in try db.prepare(table.filter(self.topicId == topicId)) {
            notes.append(Note(id: note[self.id], content: note[self.content], topicId: note[self.topicId]!))
        }
        
        return notes
    }
    
    func delete(db: Connection, id: Int64) throws {
        try db.run(table.where(self.id == id).delete())
    }
}
