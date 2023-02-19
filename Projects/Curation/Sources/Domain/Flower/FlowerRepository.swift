//
//  FlowerRepository.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

import CurationNetworking
import Models
import RxSwift

final class FlowerRepositoryImpl {
    
    private let network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol = NetworkService()) {
        self.network = network
    }
    
    func fetchAllFlower() -> Observable<FlowerModels.FetchFlowerList.Reponse> {
        return network.request(GetFlowerAPI())
            .compactMap { [weak self] response in
                return self?.convertToFlowerList(response)
            }
    }
    
    private func convertToFlowerList(_ dto: DTO.Flower) -> FlowerModels.FetchFlowerList.Reponse {
        return .init(id: dto.id,
                     name: dto.name,
                     thumbnailUrlString: dto.thumbnailUrlString,
                     floriography: dto.floriography,
                     story: dto.story,
                     othersUrlStrings: dto.othersUrlStrings)
    }
}

enum FlowerModels {
    enum FetchFlowerList {
        struct Reponse {
            var id: Int
            var name: String
            var thumbnailUrlString: String
            var floriography: String
            var story: String
            var othersUrlStrings: [String]
        }
    }
}
