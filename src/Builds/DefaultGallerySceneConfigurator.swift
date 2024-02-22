//
//  DefaultGallerySceneConfigurator.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GallerySceneConfigurator {
    /// Configuare Gallery Scens View Controller
    func configured(_ vc: GallerySceneViewController) -> GallerySceneViewController
}

final class DefaultGallerySceneConfigurator: GallerySceneConfigurator {
    
    // MARK: - GalleryScene Configurator
    func configured(_ vc: GallerySceneViewController) -> GallerySceneViewController {

        // VIP Architect setup
        let networkWorker = GalleryNetworkWorker()
        let dataWorker = GalleryCoreDataWorker()
        let interactor = GalleryInteractor()
        let presenter = GalleryPresenter()
        let router = GallerySceneRouter()
        router.source = vc
        vc.interactor = interactor
        vc.router = router
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.networkWorker = networkWorker
        interactor.dataWorker = dataWorker
        return vc
    }
}
