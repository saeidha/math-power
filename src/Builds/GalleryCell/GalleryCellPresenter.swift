//
//  GalleryCellPresenter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit
protocol GalleryCellPresentationLogic
{
    /// Fetch Image Result with cell
    func presentImageResult(image: UIImage?, error: Error?)
}

class GalleryCellPresenter
{
    // MARK: - Public Property
    weak var viewCell: GalleryCellScenceInput?
}

extension GalleryCellPresenter: GalleryCellPresentationLogic{
    // MARK: - Presentation logic
    /// present fetch image item
    func presentImageResult(image: UIImage?, error: Error?) {
        if let image = image{
            viewCell?.successFetchedPhoto(image: image)
        }
    }
}

