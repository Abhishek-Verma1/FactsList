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
     Function related to the FactsList Data parsing
     */
    static func parse<T: Parceable>(data: Data, completion : (Result<[T], ErrorResult>) -> Void) {
        
    }
    
}
