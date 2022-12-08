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
    
    func getHeroImage() -> String {
        return "https://api.opendota.com\(dotaHero[0].img)"
    }
    
    func getHeroName() -> String {
        return dotaHero[0].localizedName
    }
    
    func getHeroPrimaryAttribute() -> String {
        switch dotaHero[0].primaryAttr {
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
        return dotaHero[0].roles
    }
    
    func getHeroStrength() -> String {
        return "\(dotaHero[0].baseStr) + \(dotaHero[0].strGain)"
    }
    
    func getHeroAgility() -> String {
        return "\(dotaHero[0].baseAgi) + \(dotaHero[0].agiGain)"
    }
    
    func getHeroIntelligence() -> String {
        return "\(dotaHero[0].baseInt) + \(dotaHero[0].intGain)"
    }
    
    func getHeroBaseAttack() ->  String {
        return "\(dotaHero[0].baseAttackMin) - \(dotaHero[0].baseAttackMax)"
    }
    
    func getHeroBaseArmor() ->  String {
        return "\(dotaHero[0].baseArmor)"
    }
    
    func getHeroMovingSpeed() ->  String {
        return "\(dotaHero[0].baseArmor)"
    }
    
    func getHeroHealth() -> String {
        return "\(dotaHero[0].baseHealth)+\(dotaHero[0].baseHealthRegen)"
    }
    
    func getHeroMana() -> String {
        return "\(dotaHero[0].baseMana)+\(dotaHero[0].baseManaRegen)"
    }
}
