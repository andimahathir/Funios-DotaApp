//
//  SectionView.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 19/11/22.
//

import SwiftUI

struct SectionView: View {
    let heroType: String
    let description: String
    let heroes: DotaHeroModel
    @State var heroSelected: Bool = false
    var body: some View {
        VStack {
            HStack {
                Image(heroType)
                
                VStack (alignment: .leading) {
                    Text("\(heroType) Hero")
                        .font(.footnote.weight(.bold))
                    
                    Text(description)
                        .font(.caption2.weight(.light))
                }
                
                Spacer()
                
                NavigationLink(destination: AllHeroView(heroType: heroType, heroes: heroes)) {
                    Text("See all")
                        .font(.footnote.weight(.bold))
                }
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    
                    ForEach(heroes.prefix(3)) { hero in
                        NavigationLink(destination: DetailHeroView(dotaName: hero.localizedName), isActive: $heroSelected, label: {EmptyView()})
                        Button {
                            heroSelected.toggle()
                        } label: {
                            ZStack {
                                Color.gray
                                
                                AsyncImage(url: URL(string: hero.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    Color.gray
                                }
                                
                                VStack {
                                    Spacer()
                                    Text("\(hero.localizedName)")
                                        .foregroundColor(.white)
                                        .font(.title3.weight(.bold))
                                        .padding(.bottom)
                                }
                            }
                            .frame(width: 258, height: 144)
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(heroType: "Strength", description: "Strength hero has advantages in many HP", heroes: DotaHeroDummy)
            .padding()
    }
}
