
import SwiftUI
import Atributika

struct NoteView: View {
    let note: Note
    init(note: Note) {
        self.note = note
    }
    
    func applyStyling(note: String) throws -> AttributedString {
        let str = note
            .styleHashtags(Style.font(.boldSystemFont(ofSize: 25)))
            .styleLinks(Style.foregroundColor(.blue))
            .styleMentions(Style.foregroundColor(.darkGray))
            .attributedString
        
        return try AttributedString(str, including: \.uiKit)
    }
    
    var body: some View {
        HStack {
            Text(try! self.applyStyling(note: self.note.content))
            Spacer()
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(note: Note.sampleData[0])
    }
}
