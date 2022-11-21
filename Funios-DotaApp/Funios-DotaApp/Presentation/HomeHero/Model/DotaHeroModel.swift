//
//  DotaHeroModel.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 20/11/22.
//

import Foundation

// MARK: - DotaModelElement
struct DotaHeroElement: Codable, Identifiable {
    let id: Int
    let name, localizedName: String
    let primaryAttr: String
    let attackType: String
    let roles: [String]
    let legs: Int
    var image: String {
        let prefix: String = "npc_dota_hero_"
        let heroName: String = String(name.dropFirst(prefix.count))
        return "https://api.opendota.com/apps/dota2/images/dota_react/heroes/"+heroName+".png?"
    }

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, legs
    }
}

typealias DotaHeroModel = [DotaHeroElement]

let DotaHeroDummy: [DotaHeroElement] = [
    DotaHeroElement(id: 1, name: "npc_dota_hero_antimage", localizedName: "Anti-Mage", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
    DotaHeroElement(id: 2, name: "npc_dota_hero_bloodseeker", localizedName: "Bloodseeker", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
    DotaHeroElement(id: 3, name: "npc_dota_hero_drow_ranger", localizedName: "Drow Ranger", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
    DotaHeroElement(id: 4, name: "npc_dota_hero_antimage", localizedName: "Anti-Mage", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2),
    DotaHeroElement(id: 5, name: "npc_dota_hero_antimage", localizedName: "Anti-Mage", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], legs: 2)
]
