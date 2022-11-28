//
//  NotesListView.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct NotesListView: View {
    @State var notes: [Note] = []
    @State var isPresentingNewNoteView: Bool = false
    @State var newNoteContent: String = ""
    let database: DatabaseService?
    let topicId: Int64
    
    var body: some View {
        VStack {
            ForEach(self.notes) { note in
                NoteView(note: note)
            }
        }
        .onAppear {
            do {
                self.notes = try self.database!.getNotesForTopic(topicId: topicId)
                return
            } catch {
                self.notes = Note.sampleData
            }
            self.notes = Note.sampleData
        }
        .navigationTitle("Notes")
        .toolbar {
            Button(action: {
                isPresentingNewNoteView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewNoteView) {
            NavigationView {
                AddNoteView(content: $newNoteContent)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewNoteView = false
                                newNoteContent = ""
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                do {
                                    let note = try self.database?.addNote(content: newNoteContent, topicId: self.topicId)
                                    self.notes.append(note!)
                                } catch {
                                    print(error)
                                }
                                isPresentingNewNoteView = false
                                newNoteContent = ""
                            }
                        }
                    }
            }
        }
		
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var notes: [Note] = Note.sampleData
    static var previews: some View {
        NotesListView(database: nil, topicId: 69)
    }
}
