//
//  NewsScene.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/17/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct NewsScene: View {
    @ObjectBinding var newsStore = NewsStore()

    // MARK: Body
    var body: some View {
        NavigationView {
            Group {
                if newsStore.articles.isEmpty {
                    ActivityIndicatorView()
                } else {
                    contentView
                }
            }
            .navigationBarTitle(Text("Planeta Boca"))
            .navigationBarItems(trailing: profileNavigationIconView)
        }
    }
}

// MARK: Components Views
extension NewsScene {
    private var tabBarItemView: some View {
        return VStack {
            Image("ico_home")
            Text("News")
        }
    }

    private var contentView: some View {
        ScrollView {
            StoriesView // Stories
            NewsView // News
        }
    }

    private var StoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(newsStore.stories.identified(by: \.self)) { article in
                    StoriesRowView(withArticle: article)
                        .padding([.top, .leading], 8)
                }
            }.padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 20))
        }.frame(height: 100)
    }


    private var NewsView: some View {
        VStack {
            ForEach(newsStore.articles.identified(by: \.self)) { article in
                PresentationLink(destination: ArticleDetailScene(article: article)) {
                    ArticleRowView(withArticle: article)
                        .padding(EdgeInsets(top: 6, leading: 24, bottom: 16, trailing: 24))
                    }
            }
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
    }

    private var profileNavigationIconView: some View {
        Group {
            PresentationLink(destination: ProfileScene()) {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color.accentColor)
                    .imageScale(.large)
                    .accessibility(label: Text("My Profile"))
                    .padding()
            }
        }
    }
}


struct ArticleDetailScene : View {
   @State var article: ArticleModel?

    var body: some View {

        ZStack {
            VStack(alignment: .leading) {
                JSRemoteImage(imageUrl: article?.getBigImageUrl() ?? "")
                    .frame(height: 350)
                    .background(ThemeManager.getColor(.placeHolder))

                Spacer().frame(height: 10)

                Text(article?.getTitle() ?? "")
                    .font(Font.title)
                    .fontWeight(.heavy)
                    .color(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                    .opacity(self.article == nil ? 0 : 1)
                    .animation(.basic())

                Text(article?.getDescription() ?? "")
                    .font(Font.subheadline)
                    .color(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                    .opacity(self.article == nil ? 0 : 1)
                    .animation(.basic())

                Text("Comments")
                    .font(Font.title)
                    .fontWeight(.heavy)
                    .color(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .opacity(self.article == nil ? 0 : 1)
                    .animation(.basic())

                Spacer()

            }//.background(Color.white)
                .cornerRadius(8)

            ZStack(alignment: .topTrailing) {
                HStack(alignment: .top) {
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .padding(16)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .imageScale(.large)
                        .frame(width: 40, height: 40, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .offset(x: -16, y: 16)
                }
                Spacer()
            } .tapAction {
                self.article = nil
            }
        }

    }
}
