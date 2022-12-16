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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            
            VStack(spacing: 5) {
                HeroBannerView()
                    .environmentObject(detailHeroViewModel)
                Group {
                    HStack(spacing: 10) {
                        Text(detailHeroViewModel.getHeroName())
                            .font(Font.custom("Proxima Nova Bold", size: 40))
                            .foregroundColor(.white)
                        Image(detailHeroViewModel.getHeroPrimaryAttribute())
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(detailHeroViewModel.getHeroRoles(), id: \.self) { role in
                                Text(role)
                                    .font(Font.custom("ProximaNova-Regular", size: 18))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
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
                .padding(.horizontal, 20)
            }
            
            

            
        }.onAppear {
            Task {
                await detailHeroViewModel.getHeroStats(heroName: dotaName)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
        }
            
    }
}

struct DetailHeroView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeroView(dotaName: "Alchemist")
    }
}
