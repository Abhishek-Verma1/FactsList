//
//  FactsList.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

struct FactsList {
    let title : String
    let describtion : String
    let imageURL : String
}

/**
 For storing values in FactsList model
 */
extension FactsList : Parceable {
    
    static func parseObject(dictionary: [String : Any]) -> Result<FactsList, ErrorResult> {
        return Result.failure(ErrorResult.parser(string: "Unable to parse facts list"))
    }
    
    
}

