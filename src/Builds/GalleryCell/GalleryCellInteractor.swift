//
//  GalleryCellInteractor.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GalleryCellBusinessLogic {
    /// set image
    func setImage(imageSize: Int?)
}

class GalleryCellInteractor {
    
    // MARK: - Public Property
    var worker: GalleryCellWorker?
    var dataStore: PhotoModel.Fetch.ViewModel?
    var presenter: GalleryCellPresentationLogic?
}

extension GalleryCellInteractor: GalleryCellBusinessLogic {
    
    // MARK: - Interactor logic
    /// Set image from network call or cache
    func setImage(imageSize: Int?) {
        
        guard let dataStore = dataStore, let thumbnailUrl = dataStore.thumbnailUrl else {return}
        worker?.getImage(thumbnailUrl, imageSize: imageSize, completionhandler: { image, error in
            self.presenter?.presentImageResult(image: image, error: error)
        })
    }
}
