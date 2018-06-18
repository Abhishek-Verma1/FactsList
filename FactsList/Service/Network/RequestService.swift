//
//  RequestService.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

final class RequestService {
    
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        
        //Ignoring wrong URL
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: "URL format is wrong")))
            return nil
        }
        
        //Creating GET request
        var request = RequestFactory.request(method: .GET, url: url)
        
        //Checking network connection
        if let reachability = Reachability(), !reachability.isReachable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            //For failure case
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }
            
            //For success case
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
        
    }
    
}
