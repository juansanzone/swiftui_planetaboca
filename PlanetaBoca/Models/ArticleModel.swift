//
//  ArticleModel.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/17/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

// MARK: Article DTO Model
struct ArticleModel: Codable, Hashable {
    let id: String
    let url: String
    let titulo: String
    let resumen: String?
    let contenido: String?
    let thumbimage: String?
    let fullimage: String?
    let cantcomentarios: Int
}
