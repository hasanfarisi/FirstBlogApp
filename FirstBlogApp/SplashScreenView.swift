//
//  SplashScreenView.swift
//  FirstBlogApp
//
//  Created by mac on 10/3/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Image("splashscreen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SplashScreenView()
}
