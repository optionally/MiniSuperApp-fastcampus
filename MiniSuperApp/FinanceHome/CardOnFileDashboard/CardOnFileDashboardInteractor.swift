//
//  CardOnFileDashboardInteractor.swift
//  MiniSuperApp
//
//  Created by teamwink on 2021/11/26.
//

import ModernRIBs

protocol CardOnFileDashboardRouting: ViewableRouting {
}

protocol CardOnFileDashboardPresentable: Presentable {
    var listener: CardOnFileDashboardPresentableListener? { get set }
}

protocol CardOnFileDashboardListener: AnyObject {
}

final class CardOnFileDashboardInteractor: PresentableInteractor<CardOnFileDashboardPresentable>,
                                           CardOnFileDashboardInteractable,
                                           CardOnFileDashboardPresentableListener {
    
    weak var router: CardOnFileDashboardRouting?
    weak var listener: CardOnFileDashboardListener?
    
    override init(presenter: CardOnFileDashboardPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}
