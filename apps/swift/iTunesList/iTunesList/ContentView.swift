//
//  ContentView.swift
//  iTunesList
//
//  Created by Marco Forster on 26.04.22.
//

import SwiftUI

struct Result: Decodable {
    var resultCount: Int
    var results: [ResultEntry]
}

struct ResultEntry: Identifiable, Decodable {
    var wrapperType: String
    var artistId: Int
    var artistName: String
    
    var primaryGenreName: String?
    var artistLinkUrl: String?
    
    var collectionId: Int?
    var collectionName: String?
    var collectionViewUrl: String?
    
    var id: Int {
        get {
            return wrapperType == "artist" ? artistId : collectionId!
        }
    }
}

func loadDataJson() -> Result {
    do {
        let file = Bundle.main.url(forResource: "itunes", withExtension: "json")
        let data = try Data(contentsOf: file!)
        let decoder = JSONDecoder()
        
        return try decoder.decode(Result.self, from: data)
    } catch {
        fatalError("Couldn't load file from main bundle:\n\(error)")
    }
}

func loadDataUrl() async -> Result  {
    do {
      let data = try await download()
      let decoder = JSONDecoder()
      return try decoder.decode(Result.self, from: data)
    } catch {
        fatalError("Couldn't load file from server")
    }
}
    
func download() async throws -> Data { //use async/await
    let url = URL(string: "https://itunes.apple.com/search?term=Rolling+Stones&entity=album")
    let urlRequest = URLRequest(url: url!)
    let (data, _) = try await URLSession.shared.data(for: urlRequest)
    //optional: check response
    return data
}

struct ContentView: View {
    
    @State var data: Result = Result(resultCount: 0, results: [])
    
    func getData() async -> Void {
        await data = loadDataUrl()
        //data = loadDataJson()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(data.results) { resultEntry in
                    if resultEntry.wrapperType == "artist" {
                        NavigationLink { DetailView(entry: resultEntry) } label: {
                            VStack(alignment: .leading) {
                                Text("\(resultEntry.artistName)")
                                    .font(.title)
                                Text("Artist")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    } else {
                        NavigationLink { DetailView(entry: resultEntry) } label: {
                            VStack(alignment: .leading) {
                                Text("\(resultEntry.collectionName!)")
                                Text("Album • \(resultEntry.artistName)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    }
                }.onAppear(perform: {
                    Task {
                        await getData()
                    }
                })
            }.navigationTitle("Search Results")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DetailView: View {
    var entry: ResultEntry
    
    var body: some View {
        if entry.wrapperType == "artist" {
            VStack(alignment: .leading) {
                Text("ID: \(entry.artistId)")
                Text("Name: \(entry.artistName)")
                Text("Genre: \(entry.primaryGenreName!)")
                Text("Link: \(entry.artistLinkUrl!)")
            }
            .navigationTitle(entry.artistName)
        } else {
            VStack(alignment: .leading) {
                Text("ID: \(entry.collectionId!)")
                Text("Name: \(entry.collectionName!)")
                Text("Artist: \(entry.artistName)")
                Text("Link: \(entry.collectionViewUrl!)")
            }
            .navigationTitle(entry.collectionName!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
