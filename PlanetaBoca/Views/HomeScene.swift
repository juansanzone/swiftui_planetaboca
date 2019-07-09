//
//  HomeScene.swift
//  PlanetaBoca
//
//  Created by Juan sebastian Sanzone on 6/22/19.
//  Copyright © 2019 JuanSanzone. All rights reserved.
//

import SwiftUI

struct HomeScene: View {
    var body: some View {
         NewsScene()
    }

    private var tabBarView: some View {
        TabbedView {
            NewsScene()
                .tag(0)
            MyCommentsScene()
                .tag(1)
            }
            .edgesIgnoringSafeArea(.top)
    }
}
