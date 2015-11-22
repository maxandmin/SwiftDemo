//
//  ActivitiesCollectionViewController.swift
//  swiftdemo
//
//  Created by maxin on 15/11/21.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit
import Foundation

class ActivitiesCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    var CollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor = UIColor.whiteColor();
        self.MainCollectionView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func MainCollectionView(){
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSizeMake(110, 110)
        
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical//设置垂直显示
        
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)//设置边距
        
        flowLayout.minimumLineSpacing = 10;//每个相邻layout的上下
        
        flowLayout.minimumInteritemSpacing = 10;//每个相邻layout的左右
        
        flowLayout.headerReferenceSize = CGSizeMake(0, 0);
        CollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height), collectionViewLayout: flowLayout)
        self.view.addSubview(CollectionView!)
        
        CollectionView!.backgroundColor = UIColor.whiteColor()
        CollectionView!.alwaysBounceVertical = true
        CollectionView!.delegate = self
        CollectionView!.dataSource = self
//        CollectionView!.registerClass(FloorCollectionViewCell.self, forCellWithReuseIdentifier: "FCell")
         CollectionView!.registerNib(UINib(nibName: "FloorCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "FColl")
        
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
         let cell:FloorCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("FColl", forIndexPath: indexPath) as! FloorCollectionViewCell
        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FCell", forIndexPath: indexPath) as! FloorCollectionViewCell
//        cell.backgroundColor = UIColor.redColor()
        cell.CollLable.text = "Hello.Coll"
        cell.CollImage.image = UIImage(named: "swift-hero")
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

}
