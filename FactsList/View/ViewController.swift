//
//  ViewController.swift
//  FactsList
//
//  Created by Abhishek Verma on 6/18/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    let dataSource = FactsListDataSource()
    
    lazy var viewModel : FactsListViewModel = {
        let viewModel = FactsListViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        
        self.viewModel.fetchListDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

