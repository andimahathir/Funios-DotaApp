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
    }
    
    func getHeroStats(heroName: String) async {
        do {
            let data = try await detailHeroStatsServices.getHeroStats(endPoint: .getHeroStats)
            filterDotaHero(data, heroName)
        } catch {
            print("err while getHeroStats")
        }
    }
    
    func filterDotaHero(_ data: DotaHeroesStatsModel, _ heroName: String) {
        DispatchQueue.main.async {
            self.dotaHero = data.filter {$0.localizedName == heroName}
        }
    }
    
    func getHeroImage() -> String {
        return "https://api.opendota.com\(dotaHero.first?.img ?? "")"
    }
    
    func getHeroName() -> String {
        return dotaHero.first?.localizedName ?? ""
    }
    
    func getHeroPrimaryAttribute() -> String {
        switch dotaHero.first?.primaryAttr {
        case "agi":
            return "Agility"
        case "str":
            return "Strength"
        case "int":
            return "Intelligence"
        default:
            return ""
        }
    }
    
    func getHeroRoles() -> [String] {
        return dotaHero.first?.roles ?? [""]
    }
    
    func getHeroStrength() -> String {
        return "\(dotaHero.first?.baseStr ?? 0) + \(dotaHero.first?.strGain ?? 0)"
    }
    
    func getHeroAgility() -> String {
        return "\(dotaHero.first?.baseAgi ?? 0) + \(dotaHero.first?.agiGain ?? 0)"
    }
    
    func getHeroIntelligence() -> String {
        return "\(dotaHero.first?.baseInt ?? 0) + \(dotaHero.first?.intGain ?? 0)"
    }
    
    func getHeroBaseAttack() ->  String {
        return "\(dotaHero.first?.baseAttackMin ?? 0) - \(dotaHero.first?.baseAttackMax ?? 0)"
    }
    
    func getHeroBaseArmor() ->  String {
        return "\(dotaHero.first?.baseArmor ?? 0)"
    }
    
    func getHeroMovingSpeed() ->  String {
        return "\(dotaHero.first?.baseArmor ?? 0)"
    }
    
    func getHeroHealth() -> String {
        return "\(dotaHero.first?.baseHealth ?? 0)+\(dotaHero.first?.baseHealthRegen ?? 0)"
    }
    
    func getHeroMana() -> String {
        return "\(dotaHero.first?.baseMana ?? 0)+\(dotaHero.first?.baseManaRegen ?? 0)"
    }
}
