//
//  SettingViewController.swift
//  dreamMuscle
//
//  Created by 小西壮 on 2018/09/02.
//  Copyright © 2018年 小西壮. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var dateSettingLabel: UILabel!
    @IBOutlet weak var eventSettingLabel: UILabel!
    @IBOutlet weak var amountSettingLabel: UILabel!
    @IBOutlet weak var dateSettingPicker: UIDatePicker!
    @IBOutlet weak var eventSettingPicker: UIPickerView!
    @IBOutlet weak var amountSettingPicker: UIPickerView!
        
    
    var muscleEvent = ["PushUp","SitUps","BackExtensions","squats"]
    var number = [5,10,15,20,25,30,40,50,60,70,80,90,100]
    var settingNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        dateSettingPicker.datePickerMode = UIDatePickerMode.date
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        dateSettingPicker.date = df.date(from: "2015/01/01")!
        dateSettingPicker.minimumDate = df.date(from: "2015/01/01")
        dateSettingPicker.maximumDate = df.date(from: "2025/12/31")

        eventSettingPicker.dataSource = self
        eventSettingPicker.delegate = self
        
        amountSettingPicker.dataSource = self
        amountSettingPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dateSettingPicker(_ sender: UIDatePicker) {
    }
    
    // ピッカービューの列数 ＊必須
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // ピッカービューの行数 ＊必須
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == eventSettingPicker{
            return muscleEvent.count
        } else {
            return number.count
        }
    }
    
    // ピッカービューに表示する文字
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == eventSettingPicker{
            return muscleEvent[row]
        } else {
            return String(number[row])
        }
    }
    
    
    //  ピッカービューで選択された時に行う処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == amountSettingPicker{
            settingNumber = number[row]
            //print("選択されたのは\(row)行目で\(muscleEvent[row])です")
            //print(settingNumber)
        }
    }
    
    //データ送信
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrainingCount" {
            //destinationはsegueの遷移先
            let vc = segue.destination as! TrainingViewController
            //このvc.likedNameはListViewControllerのもの
            vc.settingNumber = self.settingNumber
//            print(settingNumber)
            vc.constSettingNumber = self.settingNumber
        }
    }
    
    @IBAction func startBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "TrainingCount", sender: self)
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
