//
//  GallerySceneViewCell.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

protocol GalleryCellScenceInput: AnyObject{
    /// Successfull set image
    func successFetchedPhoto(image: UIImage)
}

class GallerySceneViewCell: UICollectionViewCell {
    
    // MARK: - Public Property
    var interactor: GalleryCellBusinessLogic?
    var imageSize: Int?
    
    // MARK: - Private Property
    fileprivate lazy var image: UIImageView = {
     return UIImageView()
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.setCornerRadiusAndBoarder(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    /// Setup gallery scene view cell configurator
    func setup(_ dataSource: PhotoModel.Fetch.ViewModel){
        let worker = GalleryCellWorker()
        let interactor = GalleryCellInteractor()
        let presenter = GalleryCellPresenter()
        self.interactor = interactor
        presenter.viewCell = self
        interactor.presenter = presenter
        interactor.worker = worker
        interactor.dataStore = dataSource
        
        interactor.setImage(imageSize: imageSize)
    }
    
    // MARK: - Private Methods
    /// Setup UI Views
    fileprivate func setupViews() {
        self.addSubview(self.image)
        
        // Add Constraints
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.image.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.image.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}

extension GallerySceneViewCell: GalleryCellScenceInput{
    
    /// Set image from fech request
    func successFetchedPhoto(image: UIImage) {
        DispatchQueue.main.async {
                            self.image.image = image
        }
    }
}
