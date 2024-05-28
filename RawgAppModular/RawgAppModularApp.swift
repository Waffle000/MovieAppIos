//
//  RawgAppModularApp.swift
//  RawgAppModular
//
//  Created by Enrico Maricar on 26/05/24.
//

import SwiftUI
import HomeFeature
import DetailFeature
import FavoriteFeature

@main
struct RawgAppModularApp: App {
    let diContainer = DependencyInjection.shared
    var body: some Scene {
        WindowGroup {
            let homeViewModel = diContainer.container.resolve(HomeViewModel.self)!
            HomeView(viewModel: homeViewModel).environmentObject(DependencyInjection.shared.container.resolve(DetailViewModel.self)!).environmentObject(DependencyInjection.shared.container.resolve(FavoriteViewModel.self)!)
        }
    }
}
