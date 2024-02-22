//
//  GalleryInteractor.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GalleryInteractorBusinessLogic {
    /// Load Gallery
    func loadGallery()
    /// Reload Gallery
    func reloadGallery()
}

class GalleryInteractor {
    
    // MARK: - Public Property
    var presenter: GalleryPresentationBusinessLogic?
    var networkWorker: GalleryNetworkWorker?
    var dataWorker: GalleryCoreDataWorker?
}

extension GalleryInteractor: GalleryInteractorBusinessLogic {
    
    // MARK: - Interactor logic
    /// Fetch Gallery with coredata or network call
    func loadGallery() {
        dataWorker?.fetchItems(success: { response, error in
            if error == true{
                self.loadGalleryNetworkCall()
            }else{
                if response?.count ?? 0 > 1 {
                self.presenter?.presentFetchResults(response: response, error: nil)
                }else{
                    self.loadGalleryNetworkCall()
                }
            }
        }, fail: { response, error in
            self.loadGalleryNetworkCall()
        })
    }
    
    /// reload gallery condition
    func reloadGallery() {
        self.networkWorker?.removeCache()
        self.loadGalleryNetworkCall()
    }
    
    // MARK: - Private Methods
    /// Reload Gallery Network Call
    fileprivate func loadGalleryNetworkCall(){
        networkWorker?.fetch(success: { response, error in
            guard let response = response else { return }
            self.dataWorker?.syncData(response: response)
            var viewModel = [PhotoModel.Fetch.ViewModel]()
            for photo in response{
                viewModel.append(
                    PhotoModel.Fetch.ViewModel(id: photo.id, filename: photo.filename, createdAt: photo.createdAt, thumbnailUrl: photo.thumbnailUrl, downloadUrl: photo.downloadUrl)
                )
            }
            self.presenter?.presentFetchResults(response: viewModel, error: error)
        }, fail: { response, error in
            self.presenter?.presentFetchResults(response: nil, error: error)
        })
    }
}

