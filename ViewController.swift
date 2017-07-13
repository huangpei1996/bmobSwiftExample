//
//  ViewController.swift
//  bmobSwiftExample
//
//  Created by 雅风 on 2017/4/19.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveObj()
    }
    func saveObj(){
        
        let gamescore:BmobObject = BmobObject(className: "GameScore")
        //score为1200
        gamescore.setObject(222, forKey: "score")
        //设置playerName为小明
        gamescore.setObject("小白", forKey: "playerName")
        //设置cheatMode为false
        gamescore.setObject(false, forKey: "cheatMode")
        //设置age为18
        gamescore.setObject(19, forKey: "age")
        
        //文档中关于这部分方法的调用都是错误的，修改后可行
        gamescore.saveInBackground(resultBlock: {isSuccessful,error in
            print("可以")
            if error != nil{
                //发生错误后的动作
                print("error is \(error?.localizedDescription)")
            }else{
                //创建成功后会返回objectId，updatedAt，createdAt等信息
                //创建对象成功，打印对象值
                print("succ")
            }
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

