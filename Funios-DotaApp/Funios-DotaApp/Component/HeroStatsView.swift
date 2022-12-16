//
//  HeroStatsView.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 16/12/22.
//

import SwiftUI

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
