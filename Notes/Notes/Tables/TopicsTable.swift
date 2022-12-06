import Foundation
import SQLite

class TopicsTable {
    let id = Expression<Int64>("id")
    let name = Expression<String>("content")
    
    let table = Table("topics")
    
    init(db: Connection) throws {
        try db.run(table.create(ifNotExists:true) {t in
            t.column(id, primaryKey: .autoincrement)
            t.column(name)
        })
    }
    
    func insert(db: Connection, name: String) throws -> Topic {
        let id = try db.run(table.insert(self.name <- name))
        return Topic(id: id, name: name, notes: [])
    }
    
    func select(db: Connection) throws -> [Topic] {
        var topics: [Topic] = []
        for topic in try db.prepare(table) {
            topics.append(Topic(id: topic[self.id], name: topic[self.name], notes: []))
        }
        
        return topics
    }
    
    func delete(db: Connection, id: Int64) throws {
        try db.run(table.where(self.id == id).delete())
    }
}
