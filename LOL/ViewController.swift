//
//  ViewController.swift
//  LOL
//
//  Created by gdcp on 2018/4/18.
//  Copyright © 2018年 gdcp. All rights reserved.
//

import UIKit

private let LOLCellID = "LOLCellID"

class ViewController: UIViewController,UITableViewDataSource {
    
    lazy var tableView:UITableView = { [unowned self] in
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.rowHeight = 60
        //注册cell
        tableView.register(UINib(nibName: "herosTableViewCell", bundle: nil), forCellReuseIdentifier: LOLCellID)
        return tableView
    }()
   public lazy var dataList:[LOLModel] = {
        let path = Bundle.main.path(forResource: "heros", ofType: "plist")
        let array = NSArray(contentsOfFile: path!) as! [[String:Any]]
        var list = [LOLModel]()
        //遍历数组
        for item in array{
            let herosgroup = LOLModel(dict: item)
            list.append(herosgroup)
        }
        return list
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LOLCellID, for: indexPath)  as! herosTableViewCell
        cell.herosImage.image = UIImage(named: "\(dataList[indexPath.row].icon ?? "")")
        cell.heroname.text = dataList[indexPath.row].name
        cell.herointro.text = dataList[indexPath.row].intro
        return cell
    }
}

