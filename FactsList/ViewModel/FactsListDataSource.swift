//
//  FactsListDataSource.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

struct FactsListDataSource {
    
    weak var service: FactsListServiceProtocol?
    
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
