//
//  NewActivitiesViewController.swift
//  swiftdemo
//
//  Created by maxin on 15/11/20.
//  Copyright © 2015年 maxin. All rights reserved.
//

 /// 对于高级控件的使用

import UIKit
import Foundation

class NewActivitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var maintable: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor = UIColor.whiteColor();
        self.title = "布局控件使用"
      
        self.NewMainTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func NewMainTable(){
    
        maintable = UITableView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
        maintable!.dataSource = self
        maintable!.delegate = self
        maintable!.registerNib(UINib(nibName: "ActivitiesCell", bundle:nil), forCellReuseIdentifier: "Acell")
        self.view.addSubview(maintable!)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    let header =  (NSBundle.mainBundle().loadNibNamed("ActivitiesSection", owner: nil, options: nil)[0] as? ActivitiesSection)!
        return header
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let mycell:ActivitiesCell = maintable!.dequeueReusableCellWithIdentifier("Acell", forIndexPath: indexPath) as! ActivitiesCell
        if(indexPath.section==0){
        
            if(indexPath.row==0){
            
                mycell.CoustmCellTitle.text = "UICollectionViewController"
            }
        }
        
        mycell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return mycell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.section==0){
            
            if(indexPath.row==0){
                
                let Coll = ActivitiesCollectionViewController()
                Coll.title = "测试CollectionView"
                self.navigationController?.pushViewController(Coll, animated: true)
               
            }
        }

        
    }
    
    
    
}

