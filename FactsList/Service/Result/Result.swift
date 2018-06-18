//
//  Result.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    
    //For success case
    case success(T)
    
    //For failure case
    case failure(E)
}
