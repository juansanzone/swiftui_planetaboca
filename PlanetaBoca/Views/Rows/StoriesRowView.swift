//
//  StoriesRowView.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/22/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct StoriesRowView : View {
    let article: ArticleModel

    init(withArticle: ArticleModel) {
        self.article = withArticle
    }

    var body: some View {
        JSRemoteImage(imageUrl: article.getSmallImageUrl() ?? article.getBigImageUrl() ?? "")
            .frame(width: 80, height: 80)
            .background(ThemeManager.getColor(.placeHolder))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
            .shadow(radius: 5)
    }
}
