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
