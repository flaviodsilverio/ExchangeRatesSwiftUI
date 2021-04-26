//
//  ExchangeRatesMadeSimpleApp.swift
//  ExchangeRatesMadeSimple
//
//  Created by Flávio Silvério on 22/04/2021.
//

import SwiftUI

@main
struct ExchangeRatesMadeSimpleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
