//
//  DependencyInjection.swift
//  RawgAppModular
//
//  Created by Enrico Maricar on 27/05/24.
//

import Foundation
import Swinject
import SwiftData
import Core
import HomeFeature
import DetailFeature
import FavoriteFeature

@MainActor
final class DependencyInjection {
    static let shared = DependencyInjection()
    let container = Container()

    init() {
        registerServices()
        registerViewModels()
    }

    private func registerServices() {
        container.register(RemoteDataProtocol.self) { _ in
            return RemoteDataSource.shared
        }
   
        container.register(LocalDatasourceProtocol.self) { _ in
            return LocalDatasource.shared
        }

        container.register(AppRepository.self) { r in
            let apiService = r.resolve(RemoteDataProtocol.self)!
            let localDataSource = r.resolve(LocalDatasourceProtocol.self)!
            return AppRepository(apiService: apiService, localDatasource: localDataSource)
        }
    }

    private func registerViewModels() {
        
        container.register(HomeViewModel.self) { r in
            let appRepository = r.resolve(AppRepository.self)!
            return HomeViewModel(appRepository: appRepository)
        }
        
        container.register(DetailViewModel.self) { r in
            let appRepository = r.resolve(AppRepository.self)!
            return DetailViewModel(appRepository: appRepository)
        }
        
        container.register(FavoriteViewModel.self) { r in
            let appRepository = r.resolve(AppRepository.self)!
            return FavoriteViewModel(appRepository: appRepository)
        }
    }
}
