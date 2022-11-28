import SwiftUI

struct AddNoteView: View {
    @Binding var content: String
    var body: some View {
        Form {
            Section {
                TextField("Note here", text: $content)
            }
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(content: .constant(""))
    }
}
