//
//  DotaHomeServices.swift
//  Funios-DotaApp
//
//  Created by Caroline Chan on 20/11/22.
//

import Foundation

protocol DotaHomeServicesProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getHeroes(endPoint: NetworkFactory) async throws -> DotaHeroModel
}

final class DotaHomeServices: DotaHomeServicesProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getHeroes(endPoint: NetworkFactory) async throws -> DotaHeroModel {
        return try await networker.taskAsync(type: DotaHeroModel.self, endPoint: endPoint, isMultipart: false)
    }
}
