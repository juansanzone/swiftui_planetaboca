//
//  NewsStore.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/17/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI
import Combine

class NewsStore: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    var articles: [ArticleModel] = [ArticleModel]()
    var stories: [ArticleModel] = [ArticleModel]()

    init() {
        fetchStories()
        fetchLastNews()
    }
}

// MARK: Networking
extension NewsStore {
    func fetchStories() {
        NetworkLayer.request(router: NetworkRouter.getStories) { (result: Result<NewsResponseModel, Error>) in
            switch result {
            case .success(let articlesResponse):
                for articleModel in articlesResponse.articles where articleModel.getSmallImageUrl() != nil {
                    self.stories.append(articleModel)
                }
                self.didChange.send(())
            case .failure:
                #if DEBUG
                    print(result)
                #endif
            }
        }
    }

    func fetchLastNews() {
        NetworkLayer.request(router: NetworkRouter.getLastNews) { (result: Result<NewsResponseModel, Error>) in
            switch result {
            case .success(let articlesResponse):
                for articleModel in articlesResponse.articles where articleModel.getSmallImageUrl() != nil {
                    self.articles.append(articleModel)
                }
                self.didChange.send(())
            case .failure:
                #if DEBUG
                    print(result)
                #endif
            }
        }
    }
}
