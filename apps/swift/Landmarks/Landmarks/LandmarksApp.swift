//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Marco Forster on 05.04.22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
