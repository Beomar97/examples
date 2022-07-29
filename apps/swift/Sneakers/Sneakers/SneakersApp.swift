//
//  SneakersApp.swift
//  Sneakers
//
//  Created by Marco Forster on 23.06.22.
//

import SwiftUI

struct Sneaker: Identifiable, Decodable {
    var productId: String
    var displayName: String
    var altText: String
    var image1: String
    var image2: String
    var price: Int
    var color: String
    var isFavorite: Bool?
    
    var id: String {
        get {
            return productId
        }
    }
}

final class ModelData: ObservableObject {
    @Published var sneakers: [Sneaker] = loadDataJson()
}

func loadDataJson() -> [Sneaker] {
    do {
        let file = Bundle.main.url(forResource: "sneakers", withExtension: "json")
        let data = try Data(contentsOf: file!)
        let decoder = JSONDecoder()
        
        return try decoder.decode([Sneaker].self, from: data)
    } catch {
        fatalError("Couldn't load file from main bundle:\n\(error)")
    }
}

@main
struct SneakersApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
