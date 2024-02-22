//
//  GalleryPresenter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GalleryPresentationBusinessLogic
{
    /// Fetch Result and Show Items
    func presentFetchResults(response: [PhotoModel.Fetch.ViewModel]?, error: ManagerErrors?)
}

class GalleryPresenter
{
    // MARK: - Public Property
    weak var viewController: GallerySceneInput?
}

extension GalleryPresenter: GalleryPresentationBusinessLogic{
    
    // MARK: - Presentation logic
    /// present fetch viewModel
    func presentFetchResults(response: [PhotoModel.Fetch.ViewModel]?, error: ManagerErrors?) {
        
        if let error = error {
            viewController?.errorFetchingItems(message: error.description)
            
        }
        if let response = response {
            viewController?.successFetchedItems(viewModel: response)
        }
    }
}
