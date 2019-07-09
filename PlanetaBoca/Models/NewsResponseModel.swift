//
//  NewsResponseModel.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/18/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

// MARK: NewsResponse DTO Model
struct NewsResponseModel: Codable {
    let articles: [ArticleModel]

    enum CodingKeys: String, CodingKey {
        case articles = "noticias"
    }
}
