//
//  NotesListView.swift
//  Notes
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct NotesListView: View {
    let notes: [Note]
    var body: some View {
        Text(notes[0].content)
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var notes: [Note] = Note.sampleData
    static var previews: some View {
        NotesListView(notes: notes)
    }
}
