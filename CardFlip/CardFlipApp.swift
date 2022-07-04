//
//  CardFlipApp.swift
//  CardFlip
//
//  Created by Maksim Lamankiy on 04.07.2022.
//

import SwiftUI

@main
struct CardFlipApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
