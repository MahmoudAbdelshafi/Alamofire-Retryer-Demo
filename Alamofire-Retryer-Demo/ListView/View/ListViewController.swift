//
//  ListViewController.swift
//  Alamofire-Retryer-Demo
//
//  Created by Mahmoud Abdelshafi on 16/10/2021.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var viewModel: ListViewModel = {
        return ListViewModel()
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
}

//MARK: - Private Methods

extension ListViewController {
    
    private func getData() {
        viewModel.getData { (result) in
            switch result {
            case .success(let data):
                print("\n")
                print(String(data: data, encoding: .utf8))
            case .failure(let error):
                print(error)
            }
        }
    }
}
