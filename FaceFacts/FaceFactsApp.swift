//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Parth Antala on 2023-12-26.
//

import SwiftUI
import SwiftData

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
