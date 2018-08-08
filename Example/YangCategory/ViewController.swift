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
        tableView.separatorStyle = .none
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
            cell.contentView.re_addRightSeparateLine(topMargin: 30, bottomMargin: 30)
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

