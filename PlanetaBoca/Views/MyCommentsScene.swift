//
//  MyCommentsScene.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/23/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct MyCommentsScene: View {
    private let navTitle: String = "My Comments"
    private let tabBarIcoResource: String = "ico_comment"

    var body: some View {
        NavigationView {
            Group {
                Text("1")
            }.navigationBarTitle(Text(navTitle))
        }.tabItem(
            {
                Image(tabBarIcoResource)
                Text(navTitle)
            }
        )
    }
}
