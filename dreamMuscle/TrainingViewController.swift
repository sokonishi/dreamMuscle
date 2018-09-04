//
//  TrainingViewController.swift
//  dreamMuscle
//
//  Created by 小西壮 on 2018/09/02.
//  Copyright © 2018年 小西壮. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var coverLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var settingNumber:Int!
    var constSettingNumber:Int!
    var countNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(settingNumber!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countBtn(_ sender: UIButton) {
        settingNumber! -= 1
        countNumber += 1
        countLabel.text = String(settingNumber!)
        
        var opacityRate = CGFloat(countNumber) / CGFloat(constSettingNumber!)
        coverLabel.alpha = 1 - opacityRate

        if settingNumber == 0 {
            backgroundImage.image = UIImage(named: "oppai")
            
//            let pickerController = UIImagePickerController()
//            //ソースタイプを指定(cameraの場合はplistでカメラ使用を許可すること)
//            pickerController.sourceType = .camera
//            //カメラを表示
//            present(pickerController, animated: true, completion: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
