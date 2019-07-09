//
//  ArticleRowView.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/17/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct ArticleRowView : View {
    let article: ArticleModel

    init(withArticle: ArticleModel) {
        self.article = withArticle
    }

    var body: some View {
        VStack(alignment: .leading) {

            JSRemoteImage(imageUrl: article.getSmallImageUrl() ?? article.getBigImageUrl() ?? "")
                .frame(height: 250)
                .background(ThemeManager.getColor(.placeHolder))

        

            Spacer().frame(height: 10)

            Text(article.getTitle())
                .font(Font.title)
                .fontWeight(.heavy)
                .color(Color.black)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .lineLimit(4)
                .multilineTextAlignment(.leading)

            Text(article.getDescription())
                .font(Font.subheadline)
                .color(Color.black)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .lineLimit(4)
                .multilineTextAlignment(.leading)

            HStack {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(ThemeManager.getColor(.iconsOverWhite))
                    .imageScale(.medium)
                    .accessibility(label: Text("Comments"))

                Text(article.getCommentsCountText())
                    .font(Font.footnote)
                    .color(Color.black)
                    .opacity(0.8)
            }.padding(.leading, 16)

            Spacer().frame(height: 20)

        }.background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 10)
    }
}
