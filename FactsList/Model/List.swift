//
//  List.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

struct List {
    let title : String
    let describtion : String
    let imageURL : String
}

/**
 For storing values in List model
 */
extension List : Parceable {
    
    static func parseObject(dictionary: [String : Any]) -> Result<List, ErrorResult> {
        return Result.failure(ErrorResult.parser(string: "Unable to parse facts list"))
    }
    
    
}

