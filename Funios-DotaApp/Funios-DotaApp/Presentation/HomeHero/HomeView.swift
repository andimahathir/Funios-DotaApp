//
//  HomeView.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 19/11/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                GuideOfHeroView()
                
                Text("Guide Hero")
                    .font(.headline)
                
                SectionView(heroType: "Strength", description: "Strength heroes has advantages in many HP", heroes: homeViewModel.strHero)
                
                SectionView(heroType: "Agility", description: "Agility heroes has advantages in speed", heroes: homeViewModel.agiHero)
                
                SectionView(heroType: "Intelligence", description: "Intelligence heroes are smart", heroes: homeViewModel.intHero)
            }
        }
        .task {
            await homeViewModel.getHeroes()
        }
        .padding([.horizontal, .top])
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
