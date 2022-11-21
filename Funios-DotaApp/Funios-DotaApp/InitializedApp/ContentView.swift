//
//  ContentView.swift
//  Funios-DotaApp
//
//  Created by isa nur fajar on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                Text("List of hero")
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                    }
                
                Text("Heart")
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                Text("Settings")
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
            }
            .navigationTitle("Dota Hero")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
