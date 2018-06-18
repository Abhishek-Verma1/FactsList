//
//  ErrorResult.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    //For network error
    case network(string: String)
    
    //For parser error
    case parser(string: String)
    
    //For custom error
    case custom(string: String)
}

