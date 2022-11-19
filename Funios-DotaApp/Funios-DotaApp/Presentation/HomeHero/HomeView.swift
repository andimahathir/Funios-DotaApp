//
//  HomeView.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 19/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GuideOfHeroView()
                
                Text("Guide Hero")
                    .font(.headline)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Dota Hero")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button() {
                        print("sidebar")
                    } label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button() {
                        print("search")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
