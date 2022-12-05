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
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        ScrollView {
            LazyVGrid (columns: columns) {
                ForEach(heroes) { hero in
                    ZStack {
                        Color.gray
                        
                        AsyncImage(url: URL(string: hero.image)) { image in
                            image
                                .resizable()
                                .scaledToFill()
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
                    .cornerRadius(10)
                    .padding([.top, .bottom], 5)
                }
            }
            .padding([.leading, .trailing], 10)
            .padding(.top, 10)
        }
        .navigationTitle(Text("\(heroType) Hero"))
    }
}

//struct AllHeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllHeroView(heroType: "Strenght", heroes : heroes)
//    }
//}
