//
//  DetailHeroViewModel.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 08/12/22.
//

import Foundation

class DetailHeroViewModel: ObservableObject {
    @Published var dotaHero: DotaHeroesStatsModel = DotaHeroesStatsModel()
    
    private var detailHeroStatsServices: DetailHeroStatsServicesProtocol
    
    init(detailHeroStatsServices: DetailHeroStatsServicesProtocol = DetailHeroStatsServices()) {
        self.detailHeroStatsServices = detailHeroStatsServices
        dotaHero.append(DotaHeroStatsDummy)
    }
    
    func getHeroStats(heroName: String) async {
        guard let data = try? await detailHeroStatsServices.getHeroStats(endPoint: .getHeroStats) else { return }
        
        for hero in data {
            if hero.localizedName == heroName {
                self.dotaHero.removeAll()
                self.dotaHero.append(hero)
            }
        }
    }
}
