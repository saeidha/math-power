//
//  GalleryRouter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

protocol GallerySceneRoutingLogic {
    /// show Photo
    func showPhoto(viewModel: PhotoModel.Fetch.ViewModel)
    /// show load failure and try again
    func showLoadFailure(message: String)
}

final class GallerySceneRouter{
    
    // MARK: - Public Property
    weak var source: GallerySceneViewController?
    var dataSource: PhotoModel.Fetch.ViewModel?
}

extension GallerySceneRouter: GallerySceneRoutingLogic {
    
    // MARK: - GalleryScene routing logic
    /// Show Photo Scens
    func showPhoto(viewModel: PhotoModel.Fetch.ViewModel) {
        let vc = PhotoSceneViewController()
        let photoSceneConfigurator = PhotoSceneConfigurator()
        let scene = photoSceneConfigurator.configured(vc, dataSource: viewModel)
        source?.navigationController?.pushViewController(scene, animated: true)
    }
    
    /// Show alert for failure fetch condition
    func showLoadFailure(message: String) {
        let alert = UIAlertController(title: message, message: "Plase try agian", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            alert.dismiss(animated: true)
                })
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action:UIAlertAction!) in
            self.source?.reload()
            
        }))
        source?.present(alert, animated: true)
    }
}
