//
//  Previewer.swift
//  FaceFacts
//
//  Created by Parth Antala on 2024-01-02.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "Dimention Jumo", location: "Toronto")
        person = Person(name: "Parth", emailAddress: "Parth@Swift.com", details: "", metAt: event)
        
        container.mainContext.insert(person)
    }
}
