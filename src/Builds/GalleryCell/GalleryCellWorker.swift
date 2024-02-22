//
//  GalleryCellWorker.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

typealias responseImageHandler = (_ image: UIImage? , _ error: Error?) ->()

class GalleryCellWorker{

    // MARK: - Public Methods
    /// fetch image from cache or download it
    func getImage(_ image: String, imageSize: Int?, completionhandler:@escaping(responseImageHandler)){
        
        guard let imageURL = URL(string: image + (imageSize != nil ? "?h=\(imageSize!)&w=\(imageSize!)&m=crop" : "")) else {return}
            NetworkManager.shared.load(url: imageURL) { image, error in
                completionhandler(image,error)
            }
    }
}
