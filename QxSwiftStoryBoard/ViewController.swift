//
//  ViewController.swift
//  QxSwiftStoryBoard
//
//  Created by 新然 on 17/2/23.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SendDataDelete{

    @IBOutlet weak var lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.performSegueWithIdentifier("three", sender: nil)
    }

    @IBAction func gotoSecondViewController(sender: AnyObject) {
        
        lable.text="可以去SencondView"
        let viewController=UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController()
        viewController?.modalTransitionStyle = .FlipHorizontal//指定页面替换动画
      
//        var userInfo=NSUserDefaults()
//        userInfo.setValue("你好", forKey: "data")
        var notify=NSNotification(name: "qx", object: "你好")
        var notifyCenter=NSNotificationCenter.defaultCenter()
        notifyCenter.postNotification(notify)
        self.presentViewController(viewController!, animated: true, completion: nil)
//        self.navigationController?.pushViewController(viewController!, animated: true)
        //这中方法是把Second.board的UIViewController设置is insnal view cotroller 还有另种方法是设置id通过id找，然后跳转
//        let viewController2=UIStoryboard(name: "Sencond", bundle: nil).instantiateViewControllerWithIdentifier("First")
//         self.navigationController?.pushViewController(viewController2, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier==nil){
        }else{

        }}
     func onSendData(str: String) {
         NSLog(str)
    }

}

