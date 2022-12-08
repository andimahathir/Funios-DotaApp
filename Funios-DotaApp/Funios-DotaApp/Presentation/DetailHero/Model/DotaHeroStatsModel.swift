//
//  DotaHeroStatModel.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 08/12/22.
//

import Foundation

struct DotaHeroStats: Codable, Identifiable {
    let id: Int
    let name, localizedName: String
    let primaryAttr: String
    let attackType: String
    let roles: [String]
    let img: String
    let icon: String
    let baseHealth: Int
    let baseHealthRegen: Double
    let baseMana: Int
    let baseManaRegen, baseArmor: Double
    let baseMr, baseAttackMin, baseAttackMax, baseStr: Int
    let baseAgi, baseInt: Int
    let strGain, agiGain, intGain: Double
    let attackRange, projectileSpeed: Int
    let attackRate: Double
    let moveSpeed: Int
    let cmEnabled: Bool
    let legs, heroID, turboPicks, turboWINS: Int
    let proBan, proWin, proPick: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
        case baseHealth = "base_health"
        case baseHealthRegen = "base_health_regen"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case baseMr = "base_mr"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case strGain = "str_gain"
        case agiGain = "agi_gain"
        case intGain = "int_gain"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
        case cmEnabled = "cm_enabled"
        case legs
        case heroID = "hero_id"
        case turboPicks = "turbo_picks"
        case turboWINS = "turbo_wins"
        case proBan = "pro_ban"
        case proWin = "pro_win"
        case proPick = "pro_pick"
    }
}

typealias DotaHeroesStatsModel = [DotaHeroStats]


let DotaHeroStatsDummy: DotaHeroStats = DotaHeroStats(id: 1, name: "npc_dota_hero_antimage", localizedName: "Anti-Mage", primaryAttr: "agi", attackType: "Melee", roles: ["Carry", "Escape", "Nuker"], img: "/apps/dota2/images/dota_react/heroes/antimage.png?", icon: "/apps/dota2/images/dota_react/heroes/icons/antimage.png?", baseHealth: 200, baseHealthRegen: 0.25, baseMana: 75, baseManaRegen: 0, baseArmor: 0, baseMr: 25, baseAttackMin: 29, baseAttackMax: 33, baseStr: 21, baseAgi: 24, baseInt: 12, strGain: 1.6, agiGain: 2.8, intGain: 1.8, attackRange: 150, projectileSpeed: 0, attackRate: 1.4, moveSpeed: 310, cmEnabled: true, legs: 2, heroID: 1, turboPicks: 201912, turboWINS: 105754, proBan: 131, proWin: 20, proPick: 57)
