//
//  ViewController.swift
//  YangCategory
//
//  Created by xilankong on 03/21/2018.
//  Copyright (c) 2018 xilankong. All rights reserved.
//

import UIKit
import SnapKit
import YangCategory
class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .grouped)
    var tableViewAdapter: YangTableViewAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initTableView()
    }
    
    func initUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
    }
    
    func initTableView() {
        tableViewAdapter = YangTableViewAdapter(tableView) { (indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
            cell.textLabel?.text = "测试" + "\(indexPath.row)"
            cell.textLabel?.text.isNilOrEmpty
            return cell
        }
        
        tableViewAdapter.numberOfRowsInSection = { section in
            return 5
        }
        
        tableViewAdapter.cellDidSelectedAtIndexPath = { (indexPath, tableView) in
            print("test")
            
        }
        
        tableViewAdapter.cellHeightForRowAtIndexPath = { (indexPath, tableView) in
            return 100
            
        }
    }

}

