//
//  AllHeroView.swift
//  Funios-DotaApp
//
//  Created by byan on 05/12/22.
//

import SwiftUI


struct AllHeroView: View {
    
    var heroType:String
    var heroes:DotaHeroModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(heroes) { hero in
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

//struct AllHeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllHeroView(heroType: "Strenght", heroes : heroes)
//    }
//}
