//
//  ContentView.swift
//  FaceFacts
//
//  Created by Parth Antala on 2023-12-26.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = NavigationPath()
    
    @State private var sortaOrder = [SortDescriptor(\Person.name)]
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationStack(path: $path){
            PeopleView(searchString: searchText, sortOrder: sortaOrder)
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
                EditPersonView(person: person, navigationPath: $path)
            }
            .toolbar{
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortaOrder) {
                        Text("Name (A-Z)")
                            .tag([SortDescriptor(\Person.name)])
                        
                        Text("Name (Z-A)")
                            .tag([SortDescriptor(\Person.name, order: .reverse)])
                        
                    }
                }
                
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
            .searchable(text: $searchText)
        }
    }
    func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
    

  
}

#Preview {
    ContentView()
}
