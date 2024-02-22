//
//  GalleryWorker.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

typealias responseHandler = (_ response: [PhotoModel.Fetch.Response]? , _ error: ManagerErrors?) ->()

typealias responseDataHandler = (_ response: [PhotoModel.Fetch.ViewModel]? , _ error: Bool?) ->()

class GalleryNetworkWorker{
    
    // MARK: - Public Methods
    /// fetch gallery items from the API
    func fetch(success:@escaping(responseHandler), fail:@escaping(responseHandler))
    {

        guard let url = URL(string: "https://api1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/media") else { fatalError("Invalid URL") }
        
        NetworkManager.shared.request(fromURL: url) { (result: Result<[PhotoModel.Fetch.Response], ManagerErrors>) in
                switch result {
                case .success(let gallery):
                    success(gallery, nil)
                case .failure(let error):
                    fail(nil, error)
                }
             }
        }
    
    /// remove cache data
    func removeCache(){
        NetworkManager.shared.removeCache()
    }

}

class GalleryCoreDataWorker{
    
    // MARK: - Public Methods
    /// fetch gallery items from the coredata
    func fetchItems(success:@escaping(responseDataHandler), fail:@escaping(responseDataHandler)){
        
        CoreDataHelper.shared.fetchData { model, error in
            if error{
                fail(nil, true)
            }else if let model = model{
                success(model, false)
            }
        }
    }
    
    /// sync gallery items with the coredata -- delete previous data and save new data
    func syncData(response: [PhotoModel.Fetch.Response]?){
        CoreDataHelper.shared.syncData(response: response)
    }
    
}
