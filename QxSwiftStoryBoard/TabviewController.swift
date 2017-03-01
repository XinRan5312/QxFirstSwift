//
//  TabviewController.swift
//  QxSwiftStoryBoard
//
//  Created by 新然 on 17/2/28.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class TabviewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    var datas=[String]()
    
    @IBOutlet weak var tabview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabview.dataSource=self
        tabview.delegate=self
        tabview.separatorStyle=UITableViewCellSeparatorStyle.SingleLine
        tabview.separatorColor=UIColor(red: 0.0, green: 0.3, blue: 0.5, alpha: 0.5)
        initData()
        //设置上面的导航栏
           self.navigationItem.title="navigation-title"
           self.navigationController?.navigationBarHidden=false//其实这个是不管作用的如果没有在storyboard中给这个controller添加NavigationController
        let leftitem=UIBarButtonItem(title: "回去", style:UIBarButtonItemStyle.Done, target: self, action:Selector("goback"))
        let rightItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Bookmarks, target: self, action: Selector("goback"))
        self.navigationItem.leftBarButtonItem=leftitem
        self.navigationItem.rightBarButtonItem=rightItem
        
        //设置下面的toolbar
        self.navigationController?.toolbarHidden=false
        self.navigationController?.toolbar.barStyle=UIBarStyle.BlackOpaque
        self.navigationController?.toolbar.backgroundColor=UIColor(red: 0.0, green: 0.8, blue: 0.8, alpha: 1.0)
        let one=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FastForward, target: self, action: nil)
        let two=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop, target: self, action: nil)
        let three=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: nil)
        let four=UIBarButtonItem(title: "我的", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        //如果没有这个说有的toobarItem会没有间距挤在一起
        let fixspace=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        let items=[one,fixspace,two,fixspace,three,fixspace,four]
        self.setToolbarItems(items, animated: true)
        
        
//        self.navigationController?.navigationItem.title="navigation-title"
     

        
    }
    func goback(){
    NSLog("goback")
    }
    func initData(){
        for(var a=0;a<15;a++){
         datas.append("mack\(a)")
        }
      
    
    }
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }
    //MARK:UITableViewDataSource跟数据相关的代理类的方法
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCel=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "qx")
        tableViewCel.textLabel?.text=datas[indexPath.row]
        tableViewCel.detailTextLabel?.text=datas[indexPath.row]
        let img=UIImage(named: "ic_account_manager")
      
        tableViewCel.imageView?.image=img
       
        tableViewCel.backgroundColor=UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        tableViewCel.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        tableViewCel.imageView?.layer.cornerRadius=40
        tableViewCel.imageView?.layer.masksToBounds=true
        if indexPath.row/2==0{
           tableViewCel.accessoryType=UITableViewCellAccessoryType.DetailButton//如果显示不出来很可能是tabview的布局Frament超出了屏幕
        }else{
            tableViewCel.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        }
        return tableViewCel
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alertController=UIAlertController(title: "提示", message: "点击的是第\(indexPath.row)行", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction=UIAlertAction(title: "Sure", style: UIAlertActionStyle.Default, handler:{(action:UIAlertAction!)->Void in
            let alertSheetController=UIAlertController(title: "温馨提示", message: "真的要取消吗", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let cancelAction=UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: {(action:UIAlertAction)->Void in
                self.performSegueWithIdentifier("collection", sender: nil)
                
            
            })
            alertSheetController.addAction(cancelAction)
            self.presentViewController(alertSheetController, animated: true, completion: nil)
        
        })
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction=UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {(action:UITableViewRowAction,indexPath:NSIndexPath)->Void in
           let menu=UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            let cancel=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {(action:UIAlertAction)->Void in
            NSLog("cancel")
            })
            let faceBookAction=UIAlertAction(title: "faceBook", style: UIAlertActionStyle.Default, handler: nil)
            let twiterAction=UIAlertAction(title: "twiter", style: UIAlertActionStyle.Default, handler: nil)
            menu.addAction(cancel)
            menu.addAction(faceBookAction)
            menu.addAction(twiterAction)
            self.presentViewController(menu, animated: true, completion: nil)

        })
        
        let deleteAction=UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action:UITableViewRowAction,indexPath:NSIndexPath)->Void in
             self.datas.removeAtIndex(indexPath.row)
               self.tabview.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        
        })
        return [shareAction,deleteAction]
    }
    func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        
    }
    func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
    }
    
}
