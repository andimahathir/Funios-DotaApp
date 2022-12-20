//
//  DetailHeroServices.swift
//  Funios-DotaApp
//
//  Created by Ade Dwi Prayitno on 08/12/22.
//

import Foundation

protocol DetailHeroStatsServicesProtocol: AnyObject {
    var networker: NetworkerProtocol {get}
    func getHeroStats(endPoint: NetworkFactory) async throws -> DotaHeroesStatsModel
}

final class DetailHeroStatsServices: DetailHeroStatsServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getHeroStats(endPoint: NetworkFactory) async throws -> DotaHeroesStatsModel {
        return try await networker.taskAsync(type: DotaHeroesStatsModel.self, endPoint: endPoint, isMultipart: false)
    }
}
