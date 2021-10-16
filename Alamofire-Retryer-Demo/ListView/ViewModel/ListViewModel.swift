//
//  ListViewModel.swift
//  Alamofire-Retryer-Demo
//
//  Created by Mahmoud Abdelshafi on 16/10/2021.
//

import Foundation

class ListViewModel {
    
    //MARK: - Methods
    
    func getData(_ completion: @escaping (Result<Data, CustomError>) -> Void) {
        let url = "https://api.petfinder.com/v2/animals"
        NetworkManager.shared.request(url) { (result) in
            completion(result)
        }
    }
}
