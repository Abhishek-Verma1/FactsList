//
//  FactsListService.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

protocol FactsListServiceProtocol : class {
    func fetchFactsList(_ completion: @escaping ((Result<[List], ErrorResult>) -> Void))
}

class FactsListService {
    
    static let shared = FactsListService()
    
    //API endpoint URL
    let endpoint = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    var task : URLSessionTask?
    
    func fetchFactsList(completion: @escaping ((Result<[List],ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchFactsList()
    }
    
    func cancelFetchFactsList() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
    
}