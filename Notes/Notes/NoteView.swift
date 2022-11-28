
import SwiftUI

struct NoteView: View {
    let note: Note
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        Text(self.note.content)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(note: Note.sampleData[0])
    }
}
