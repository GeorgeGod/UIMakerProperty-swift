//
//  ViewController.swift
//  Kaola
//
//  Created by 虞嘉伟 on 2017/12/26.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    typealias AddBlock = (Int, Int) -> (Int)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Add : AddBlock = {
            (c, d) in
            return c+d
        }
        
        print(Add(3, 5))
        
        
        let b1 = {
            print("闭包一")
        }
        
        let b2 = {
            (x: Int) ->() in
            
            print(x)
        }
        
        let b3 = {
            (y: Int) -> Int in
            return y+1
        }
        
        let b4 = {
            (color: UIColor) -> UIView in
            let view = UIView()
            view.backgroundColor = color
            return view
        }
        
        b1()
        b2(10)
        print(b3(20))
        print(b4(UIColor.red))
        
        UIView().setFrame(CGRect(x: 100, y: 100, width: 100, height: 100)).setBackColor(UIColor.red).setSuperView(self.view)
    }
}

extension UIView {
//    typealias ColorBlock = (UIColor) -> (UIView)
    var setBackColor : (UIColor)->(UIView) {
        let b4 = {
            (color: UIColor) -> UIView in
            self.backgroundColor = color
            return self
        }
        return b4
    }
    
    var setFrame : (CGRect)->(UIView) {
        return {
            frame -> UIView in
            self.frame = frame
            return self
        }
    }
    
    var setSuperView : (UIView)->(UIView) {
        return {
            superView -> UIView in
            superView.addSubview(self)
            return self
        }
    }
}
