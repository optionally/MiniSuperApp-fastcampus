//
//  CardOnFileDashboardBuilder.swift
//  MiniSuperApp
//
//  Created by teamwink on 2021/11/26.
//

import ModernRIBs

protocol CardOnFileDashboardDependency: Dependency {
}

final class CardOnFileDashboardComponent: Component<CardOnFileDashboardDependency> {
}

protocol CardOnFileDashboardBuildable: Buildable {
    func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting
}

final class CardOnFileDashboardBuilder: Builder<CardOnFileDashboardDependency>,
                                        CardOnFileDashboardBuildable {
    
    override init(dependency: CardOnFileDashboardDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting {
        let component = CardOnFileDashboardComponent(dependency: dependency)
        let viewController = CardOnFileDashboardViewController()
        let interactor = CardOnFileDashboardInteractor(presenter: viewController)
        interactor.listener = listener
        return CardOnFileDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
	
