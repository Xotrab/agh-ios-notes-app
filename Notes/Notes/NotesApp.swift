//
//  NotesApp.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TopicsListView(topics: Topic.sampleData)
            }
        }
    }
}
