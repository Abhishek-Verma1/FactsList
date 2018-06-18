//
//  FactsListViewModel.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

struct FactsListViewModel {
    
    weak var service: FactsListServiceProtocol?
    weak var dataSource : GenericDataSource<List>?
    
    init(service: FactsListServiceProtocol = FactsListService.shared, dataSource : GenericDataSource<List>?) {
        self.service = service
        self.dataSource = dataSource
    }
    
    func fetchListDate(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Service is missing")))
            return
        }
        
        service.fetchFactsList { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let list) :
                    // reload data
                    self.dataSource?.data.value = list
                    completion?(Result.success(true))
                    
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    completion?(Result.failure(error))
                    
                    break
                }
            }
        }
    }

}
