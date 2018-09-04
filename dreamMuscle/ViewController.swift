//
//  ViewController.swift
//  dreamMuscle
//
//  Created by 小西壮 on 2018/09/01.
//  Copyright © 2018年 小西壮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coverColor: UILabel!
    @IBOutlet weak var myWallPaper: UIImageView!
    
    var wallpaperImg = ["muscle1","muscle2","muscle3","muscle4","muscle5","muscle6","muscle7","muscle8","muscle9","muscle10","muscle11","muscle12","muscle13",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        //　ナビゲーションバーの背景色
//        self.navigationController?.navigationBar.barTintColor = .clear
//        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
//        self.navigationController?.navigationBar.tintColor = .white
//        // ナビゲーションバーのテキストを変更する
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            // 文字の色
//            .foregroundColor: UIColor.white
//        ]
        
       // ナビゲーションバー透明
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        //壁紙をランダムに変更
        let random = Int(arc4random()) % wallpaperImg.count
        myWallPaper.image = UIImage(named: wallpaperImg[random])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

