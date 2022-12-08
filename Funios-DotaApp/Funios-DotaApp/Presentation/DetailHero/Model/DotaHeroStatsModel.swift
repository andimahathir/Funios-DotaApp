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
    var image: String {
        return "https://api.opendota.com/+\(img)"
    }
    let icon: String
    var heroIcon: String {
        return "https://api.opendota.com/+\(icon)"
    }
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

typealias DotaHeroesStats = [DotaHeroStats]



