//
//  AngelView.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/10.
//

import SwiftUI

class ReadData: ObservableObject {
    
    @Published var angels = [Angel]()
    
    @Published var angelDetails = [AngelDetail]()
    
    init() {
        loadAngels()
        loadAngelDetails()
    }
    
    func loadAngels() {
        guard let angelUrl = Bundle.main.url(forResource: "angels", withExtension: "json") else { return }
        guard let angelData = try? Data(contentsOf: angelUrl) else { return }
        guard let angels = try? JSONDecoder().decode([Angel].self, from: angelData) else { return }
        self.angels = angels
    }
    
    func loadAngelDetails() {
        guard let impressionUrl = Bundle.main.url(forResource: "impressions", withExtension: "json") else { return }
        guard let noteUrl = Bundle.main.url(forResource: "notes", withExtension: "json") else { return }
        guard let impressionData = try? Data(contentsOf: impressionUrl) else { return }
        guard let noteData = try? Data(contentsOf: noteUrl) else { return }
        guard let impressions = try? JSONDecoder().decode([AngelDetail].self, from: impressionData) else { return }
        guard let notes = try? JSONDecoder().decode([AngelDetail].self, from: noteData) else { return }
        self.angelDetails = impressions + notes
    }
}

struct AngelView: View {
    
    @ObservedObject var datas = ReadData()
    
    @State private var searchText = ""
    
    var searchResults: [Angel] {
        if searchText.isEmpty {
            return datas.angels
        } else {
            return datas.angels.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults) { angel in
                    NavigationLink(destination: AngelDetailView(
                        angel: angel,
                        angelDetails: datas.angelDetails.filter { $0.aid == angel.aid })
                    ) {
                        AngelListView(angel: angel)
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }
}

struct AngelView_Previews: PreviewProvider {
    
    static var previews: some View {
        AngelView()
    }
}
