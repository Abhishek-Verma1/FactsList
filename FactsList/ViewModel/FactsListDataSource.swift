//
//  FactsListDataSource.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class FactsListDataSource: GenericDataSource<FactsList>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //Fixed for now
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("data.value.count",data.value.count)
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsListCell", for: indexPath) as! FactsListCell
        
        let listValue = self.data.value[indexPath.row]
        cell.displayFacts(factsList: listValue)
        
        return cell
    }
    
}
