//
//  ContentView.swift
//  Sneakers
//
//  Created by Marco Forster on 23.06.22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            Text("Guten Tag Peter Muster")
                .font(.title)
            TabView {
                ProductsView()
                    .tabItem {
                        Label("Produkte", systemImage: "cart")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Wunschliste", systemImage: "heart")
                    }
            }
        }
    }
}

struct ProductsView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var displayedSneakers: [Sneaker] = []
    @State var currentFilter: (Int, Int) = (Int.min, Int.max)
    
    func filterByPrice(min: Int, max: Int) -> Void {
        displayedSneakers = modelData.sneakers.filter { sneaker in
            (sneaker.price >= min && sneaker.price <= max)
        }
        currentFilter = (min, max)
    }
    
    func toggleFavorite(id: String) {
        let index = modelData.sneakers.firstIndex(where: {$0.id == id})!
        if modelData.sneakers[index].isFavorite == true {
            modelData.sneakers[index].isFavorite = false
        } else {
            modelData.sneakers[index].isFavorite = true
        }
        let (min, max) = currentFilter
        filterByPrice(min: min, max: max)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    displayedSneakers = modelData.sneakers
                } label: {
                    Text("Reset")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60, alignment: .center)
                        .border(.black)
                }
                Button{
                    filterByPrice(min: Int.min, max: 100)
                } label: {
                    Text("< 100")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60, alignment: .center)
                        .border(.black)
                }
                Button{
                    filterByPrice(min: 100, max: 120)
                } label: {
                    Text("100 - 120")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60, alignment: .center)
                        .border(.black)
                }
                Button{
                    filterByPrice(min: 120, max: 150)
                } label: {
                    Text("120 - 150")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60, alignment: .center)
                        .border(.black)
                }
                Button{
                    filterByPrice(min: 150, max: 170)
                } label: {
                    Text("150 - 170")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60, alignment: .center)
                        .border(.black)
                }
                Button{
                    filterByPrice(min: 170, max: Int.max)
                } label: {
                    Text("> 170")
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60, alignment: .center)
                        .border(.black)
                }
            }
            List(displayedSneakers) { sneaker in
                HStack(alignment: .center) {
                    Image("\(sneaker.image1.replacingOccurrences(of: ".jpg", with: ""))")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .border(.black)
                    Text("\(sneaker.displayName)")
                    Spacer()
                    Text("\(sneaker.price) CHF")
                    Button{
                        toggleFavorite(id: sneaker.id)
                    } label: {
                        if sneaker.isFavorite == true {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(.black)
                        } else {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(.black)
                        }
                    }
                }
            }.onAppear(perform: {
                Task {
                    displayedSneakers = modelData.sneakers
                }
            })
        }
    }
}

struct FavoritesView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var filteredSneakers: [Sneaker] {
        modelData.sneakers.filter { sneaker in
            (sneaker.isFavorite == true)
        }
    }
    
    func getTotal() -> Int {
        var total: Int = 0
        for sneaker in filteredSneakers {
            total += sneaker.price
        }
        return total
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(modelData.sneakers) { sneaker in
                    if sneaker.isFavorite == true {
                        HStack(alignment: .center) {
                            Image("\(sneaker.image1.replacingOccurrences(of: ".jpg", with: ""))")
                                .resizable().scaledToFit().frame(height: 100).border(.black)
                            Text("\(sneaker.displayName)")
                            Spacer()
                            Text("\(sneaker.price) CHF")
                        }
                    }
                }
                HStack {
                    Text("Total:")
                    Spacer()
                    Text("\(getTotal()) CHF")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
