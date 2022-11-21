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
                
                Button() {
                    print("see all")
                } label: {
                    Text("See all")
                        .font(.footnote.weight(.bold))
                }
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(heroes.prefix(3)) { hero in
                        ZStack {
                            Color.gray
                            
                            Text("\(hero.localizedName)")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        .frame(width: 150, height: 172)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(heroType: "Strength", description: "Strength hero has advantages in many HP", heroes: [
            DotaHeroElement(id: 1, name: "npc_dota_hero_antimage", localizedName: "Anti-Mage", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
            DotaHeroElement(id: 2, name: "npc_dota_hero_antimage", localizedName: "Bloodseeker", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
            DotaHeroElement(id: 3, name: "npc_dota_hero_antimage", localizedName: "Drow Ranger", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
            DotaHeroElement(id: 4, name: "npc_dota_hero_antimage", localizedName: "Naruto", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
            DotaHeroElement(id: 5, name: "npc_dota_hero_antimage", localizedName: "Sasuke", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2)
        ])
            .padding()
    }
}
