//
//  EditEventView.swift
//  FaceFacts
//
//  Created by Parth Antala on 2023-12-26.
//

import SwiftUI

struct EditEventView: View {
    @Bindable var event: Event
    var body: some View {
        Form{
            TextField("Name of Event", text:$event.name)
            TextField("Location", text:$event.location)
        }
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditPersonView(person: previewer.person, navigationPath: .constant(NavigationPath()))
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed")
    }
}
