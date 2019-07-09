//
//  ArticleViewModel.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/17/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

// MARK: ViewModel basic extension for Article DTO Model
extension ArticleModel {
    func getId() -> String {
        return id
    }

    func getUrl() -> String {
        return url
    }

    func getTitle() -> String {
        return titulo
    }

    func getSmallImageUrl() -> String? {
        return thumbimage
    }

    func getBigImageUrl() -> String? {
        return fullimage
    }

    func getDescription() -> String {
        return resumen ?? ""
    }

    func getBody() -> String {
        return contenido ?? ""
    }
}

// MARK: ViewModel business extension
extension ArticleModel {
    func getCommentsCountText() -> String {
        let commentStr: String = cantcomentarios > 1 ? "Comments".localizedCapitalized : "Comment".localizedCapitalized
        return "\(cantcomentarios) \(commentStr)"
    }

    func getRemoteImageURL() -> URL {
        if let remoteUrl = URL(string:  getSmallImageUrl() ?? getBigImageUrl() ?? "") {
            return remoteUrl
        }
        return URL(fileURLWithPath: "")
    }
}
