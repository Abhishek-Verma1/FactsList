//
//  ParserHelper.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/19/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

protocol Parceable {
    static func parseObject(dictionary: [String: Any]) -> Result<Self, ErrorResult>
}

final class ParserHelper {
    
    /**
     Function related to the FactsList data parsing
     */
    // FIXME: We can optimize this method later
    static func parse<T: Parceable>(data: Data, completion : (Result<[T], ErrorResult>) -> Void) {
        
        if let value = String(data: data, encoding: String.Encoding.ascii) {
            
            if let jsonData = value.data(using: String.Encoding.utf8) {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                       
                        if let arr = json["rows"] as? [[String: Any]] {
                            debugPrint(arr)
                            
                            // init final result
                            var finalResult : [T] = []
                            
                            for dictObject in arr {
                                
                                //check foreach dictionary if parseable
                                switch T.parseObject(dictionary: dictObject) {
                                case .failure(_):
                                    continue
                                case .success(let newModel):
                                    finalResult.append(newModel)
                                    break
                                }
                            }
                            completion(.success(finalResult))
                        }
                    } else {  completion(.failure(.parser(string: "Error while parsing json data")))}
                    
                } catch {
                    // can't parse json
                    completion(.failure(.parser(string: "Error while parsing json data")))
                }
                
            } else {  completion(.failure(.parser(string: "Error while parsing json data")))}
        } else {
            completion(.failure(.parser(string: "Error while parsing json data")))
        }
    }
    
}
