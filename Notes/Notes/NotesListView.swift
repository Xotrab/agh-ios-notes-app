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
    
    func delete(at offsets: IndexSet) {
        let index = offsets.first
        do {
            try self.database?.deleteNote(id: self.notes[index!].id)
            self.notes.remove(atOffsets: offsets)
        }
        catch {
            print(error)
        }
    }
    
    var body: some View {
        List {
            ForEach(self.notes) { note in
                NoteView(note: note)
            }.onDelete(perform: delete)
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
            }.disabled(self.notes.count >= 25)
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
