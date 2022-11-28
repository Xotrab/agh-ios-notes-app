//
//  NotesApp.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

@main
struct NotesApp: App {
    let database: DatabaseService
    init() {
        do {
            self.database = try DatabaseService()
        } catch {
            fatalError("Unable to setup local database")
        }
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TopicsListView(database: database)
            }
        }
    }
}
