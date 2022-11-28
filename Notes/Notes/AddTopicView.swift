//
//  AddTopicView.swift
//  Notes
//
//  Created by user229941 on 11/27/22.
//

import SwiftUI

struct AddTopicView: View {
    @Binding var name: String
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
            }
        }
    }
}

struct AddTopicView_Previews: PreviewProvider {
    static var previews: some View {
        AddTopicView(name: .constant(""))
    }
}
