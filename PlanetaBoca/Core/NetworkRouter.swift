//
//  NetworkRouter.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/17/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import Foundation

enum NetworkRouter {
    case getLastNews
    case getStories

    var scheme: String {
        switch self {
        case .getLastNews, .getStories:
            return "http"
        }
    }

    var host: String {
        return "www.planetabocajuniors.com.ar"
    }

    var path: String {
        switch self {
        case .getLastNews:
            return "/serviciosBB/services-ios/max_noticias_categoria.php"
        case .getStories:
            return "/serviciosBB/services-ios/max_noticias.php"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getStories:
            return [URLQueryItem(name: "TAMANIO", value: "10"),
                    URLQueryItem(name: "lastID", value: "")]
        case .getLastNews:
            return [URLQueryItem(name: "TAMANIO", value: "10"),
                    URLQueryItem(name: "lastID", value: ""),
                    URLQueryItem(name: "CATEGORIA", value: "futbol-local")]
        }
    }

    var method: String {
        switch self {
        case .getLastNews, .getStories:
            return "GET"
        }
    }
}

/*
 static let RecentNews = "http://www.planetabocajuniors.com.ar/serviciosBB/services-ios/max_noticias.php?"
 static let SingleArticle = "http://www.planetabocajuniors.com.ar/serviciosBB/services-ios/max_noticias_id.php?"
 static let CommentsOfArticle = "http://www.planetabocajuniors.com.ar/serviciosBB/services-ios/max_listar_comentarios.php?"
 static let CreateComment = "http://www.planetabocajuniors.com.ar/serviciosBB/services/max_hacer_comentario.php?MODELO=iOS"
 static let RecentForCategory = "http://www.planetabocajuniors.com.ar/serviciosBB/services-ios/max_noticias_categoria.php?"
 */
