//
//  ViewController.swift
//  swiftdemo
//
//  Created by maxin on 15/11/19.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView   : UITableView?
    var items       : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        self.title = "UI测试";
        self.items = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIActionSheet", "UIActivityIndicatorView"]
        
        let nextItem=UIBarButtonItem(title:"常用布局控件",style:.Plain,target:self,action:"next");
        //  添加到到导航栏上
        self.navigationItem.rightBarButtonItem = nextItem;
        
        self.maintebleview();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func next(){
    
        let NewActivies = NewActivitiesViewController()
        self.navigationController!.pushViewController(NewActivies, animated: true)
        
    
    }
    

    func maintebleview(){
    
        self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view?.addSubview(self.tableView!)
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.items?.count)!;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.text = self.items?.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let Activities = ActivitiesViewController();
        Activities.title = items? .objectAtIndex(indexPath.row) as?String
        Activities.Index = String(indexPath.row+1)
        self.navigationController!.pushViewController(Activities, animated:true);
        
    }

}

