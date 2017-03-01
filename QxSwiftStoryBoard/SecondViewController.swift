//
//  SecondViewController.swift
//  QxSwiftStoryBoard
//
//  Created by 新然 on 17/2/24.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class SecondViewController:UIViewController {
    @IBOutlet weak var LableText: UILabel!
    var sendDataDlete:SendDataDelete!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        var userInfo=NSUserDefaults()
//        LableText.text=userInfo.stringForKey("data")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handlerNotify:"), name: "qx", object: nil)
        if((sendDataDlete) != nil){
            sendDataDlete.onSendData("已经传过来数据了")
        }
        
    }
    func  handlerNotify(notify:NSNotification){
        var str=notify.object as! String
        LableText.text=str
    
    }
    @IBAction func goToSecondBord(sender: AnyObject) {
        let vc=UIStoryboard(name: "Second", bundle: nil).instantiateViewControllerWithIdentifier("home")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func goBack(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
}
