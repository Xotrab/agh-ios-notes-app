import SwiftUI
import PhotosUI
import Vision

struct AddNoteView: View {
    @Binding var content: String
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var displayImage: Bool = false
    
    func detectText() {
        let requestHandler = VNImageRequestHandler(data: selectedImageData!)
        
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)

        do {
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the request: \(error).")
        }
        
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
            return
        }
        
        let recognizedStrings = observations.compactMap { observation in
            return observation.topCandidates(1).first?.string
        }
        dump(recognizedStrings)
        let joinedNote = recognizedStrings.joined(separator: "\n")
        content = joinedNote
        displayImage = false
    }
    
    var body: some View {
        Form {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Select a photo")
                
            }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                            displayImage = true
                        }
                    }
                }
            if displayImage {
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Section {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                        
                        Button("Detect text") {
                            detectText()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }

            Section {
                TextEditor(text: $content)
            }
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(content: .constant(""))
    }
}
