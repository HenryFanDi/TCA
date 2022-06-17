//
//  AngelView.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/10.
//

import SwiftUI
import RiveRuntime

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
        var angels: [Angel]
        if searchText.isEmpty {
            angels = datas.angels
        } else {
            angels = datas.angels.filter { $0.name.contains(searchText) }
        }
        return angels.sorted { $0.updatedAt > $1.updatedAt }
    }
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .regular)
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                RiveViewModel(fileName: "shapes").view()
                    .ignoresSafeArea()
                    .blur(radius: 30)
                    .background(
                        Image("Spline")
                            .blur(radius: 50)
                            .offset(x: 200, y: 100)
                    )
                
                List(searchResults) { angel in
                    let detailView = AngelDetailView(
                        angel: angel,
                        angelDetails: datas.angelDetails
                            .filter { $0.aid == angel.aid }
                            .sorted { $0.updatedAt > $1.updatedAt }
                    )
                    AngelListView(angel: angel)
                        .overlay(
                            NavigationLink(
                                destination: detailView,
                                label: { EmptyView() }
                            )
                            .opacity(0)
                        )
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .background(Color.clear)
                .navigationTitle("聊名單")
                .searchable(text: $searchText)
            }
        }
    }
}

struct AngelView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
//            AngelView()
            AngelView()
                .preferredColorScheme(.dark)
        }
    }
}
