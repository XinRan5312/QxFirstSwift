//
//  CollectionViewController.swift
//  QxSwiftStoryBoard
//
//  Created by 新然 on 17/3/1.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class CollectionViewController:UIViewController{
    @IBOutlet weak var collectionView1: UICollectionView!
    let screenWith=UIScreen.mainScreen().bounds.width
    let screenHeight=UIScreen.mainScreen().bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    func initView(){
    let layout=UICollectionViewFlowLayout()
        layout.itemSize=CGSize(width: screenWith/2, height: screenHeight/3)
        layout.scrollDirection = .Vertical
        layout.minimumInteritemSpacing=1
        layout.minimumLineSpacing=1
        collectionView1.backgroundColor=UIColor.whiteColor()
        collectionView1.dataSource=self
        collectionView1.delegate=self
        
        collectionView1.collectionViewLayout=layout
        //注册Cell
        collectionView1.registerNib(UINib(nibName: "CollectionViewCel", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView1.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind : UICollectionElementKindSectionHeader,withReuseIdentifier: "headView")
    }
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }


}
//不要在原类CollectionViewController的结尾}里 因为他是独立的 跟java语法是不一样的
extension CollectionViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cel=collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCel
        cel.imageView.image=UIImage(named: "ic_account_manager")
        cel.lable.text="CollectionView"
        return cel
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headView=collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", forIndexPath: indexPath)
        return headView
    }
    //headview大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWith, height: 20)

    }
    //item的小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if(indexPath.row%2==1){
            return CGSize(width: screenWith/2, height: screenHeight/2)

        }else{
            return CGSize(width: screenWith/3, height: screenHeight/3)

        }
        
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("点击了第%d行", indexPath.row)
    }
}
