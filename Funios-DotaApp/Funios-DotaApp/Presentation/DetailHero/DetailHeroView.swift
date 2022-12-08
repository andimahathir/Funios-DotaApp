//
//  DetailHeroView.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 08/12/22.
//

import SwiftUI

struct DetailHeroView: View {
    var dotaName: String
    @StateObject var detailHeroViewModel: DetailHeroViewModel = DetailHeroViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            
            VStack(spacing: 5) {
                AsyncImage(url: URL(string: detailHeroViewModel.getHeroImage())) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }.frame(width: 385 ,height: 300)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom))
                
                HStack(spacing: 10) {
                    Text(detailHeroViewModel.getHeroName())
                        .font(Font.custom("Proxima Nova Bold", size: 40))
                        .foregroundColor(.white)
                    Image(detailHeroViewModel.getHeroPrimaryAttribute())
                    Spacer()
                }
                
                HStack {
                    ForEach(detailHeroViewModel.getHeroRoles(), id: \.self) { role in
                        Text(role)
                            .font(Font.custom("ProximaNova-Regular", size: 18))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                ZStack {
                    Color("BaseColor")
                        .cornerRadius(20)
                    
                    HeroStatsView()
                        
                        .environmentObject(detailHeroViewModel)
                }
                .padding(.top, 20)
                .frame(width: 380, height: 220)
            }
            
        }.task {
            await detailHeroViewModel.getHeroStats(heroName: dotaName)
        }
        .ignoresSafeArea()
            
    }
}

struct DetailHeroView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeroView(dotaName: "Axe")
    }
}

struct HeroStatsView: View {
    @EnvironmentObject var detailHeroViewModel: DetailHeroViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stats")
                .font(Font.custom("Proxima Nova Extrabold", size: 20))
                .padding(.top, 10)
            
            HStack(alignment: .top, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Attributes")
                        .font(Font.custom("Proxima Nova Bold", size: 16))
                    HStack {
                        Image("Strength")
                        Text(detailHeroViewModel.getHeroStrength())
                    }
                    
                    HStack {
                        Image("Agility")
                        Text(detailHeroViewModel.getHeroAgility())
                    }
                    
                    HStack {
                        Image("Intelligence")
                        Text(detailHeroViewModel.getHeroIntelligence())
                    }
                }
                Color(.gray)
                    .frame(width: 1, height: 140)
                
                VStack(alignment: .leading) {
                    Text("Ability")
                        .font(Font.custom("Proxima Nova Bold", size: 16))
                    HStack {
                        Image("AttackSymbol")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text(detailHeroViewModel.getHeroBaseAttack())
                    }
                    
                    HStack {
                        Image("ShieldSymbol")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text(detailHeroViewModel.getHeroBaseArmor())
                    }
                    
                    HStack {
                        Image("MovingSpeedSymbol")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text(detailHeroViewModel.getHeroMovingSpeed())
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.green)
                        Text(detailHeroViewModel.getHeroHealth())
                            .padding(2)
                            .background {
                                Color.green
                            }
                    }
                    
                    HStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("BlueColaColor"))
                        Text(detailHeroViewModel.getHeroHealth())
                            .padding(2)
                            .background {
                                Color("BlueColaColor")
                            }
                    }
                    Spacer()
                    Spacer()
                    
                }
            }
        }
        .font(Font.custom("ProximaNova-Regular", size: 16))
        .padding(5)
        .padding(.bottom, 15)
        .foregroundColor(.white)
    }
}
