
import SwiftUI

struct NoteView: View {
    let note: Note
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        HStack {
            Text(self.note.content)
            Spacer()
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(note: Note.sampleData[0])
    }
}
