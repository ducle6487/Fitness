//
//  LetStartExcerciseViewController.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/10/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit
import AVFoundation

class LetStartExcerciseViewController: UIViewController {

    var audioPlay: AVAudioPlayer?
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var stepsLb: UILabel!
    @IBOutlet weak var blackViewVw: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var timeCounterLb: UILabel!
    @IBOutlet weak var namePopupLb: UILabel!
    @IBOutlet weak var setCounterLb: UILabel!
    @IBOutlet weak var navigationTimerLb: UILabel!
    @IBOutlet weak var videoView: VideoView!
    
    // variable BaiTap
    var name:String?
    var step:String?
    var image:String?
    var set:Int?
    var restTime:Int?
    var setTime:Int?
    var currentTime:Int?
    var currentSet:Int?
    var timer: Timer?
    var timerLoop: Timer?
    var status:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.setUrl(url: "https://dl.dropboxusercontent.com/s/l65jm79el20vqnh/mv.mp4")
        setWhileStartView()
    }
    
    @IBAction func playVideoViewBt(_ sender: Any) {
        (sender as? UIButton)?.isHidden = true
        videoView.play()
    }
    
    func setWhileStartView(){
        namePopupLb.text = name
        setCounterLb.text = "\(set!) Set"
        nameLb.text = name!
        stepsLb.text = step!
        timeCounterLb.text = String(setTime!)
    }

    @IBAction func startAct(_ sender: Any) {
        navigationTimerLb.isHidden = true
        blackViewVw.isHidden = false
        popupView.isHidden = false
        blackViewVw.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.gestureTap)))
    }
    
    @IBAction func endPopupBt(_ sender: Any) {
        gestureTap()
    }
    
    @objc func gestureTap(){
        blackViewVw.isHidden = true
        popupView.isHidden = true
        if(status == false){
            navigationTimerLb.isHidden = false
        }else{
            navigationTimerLb.isHidden = true
        }
        
    }
    
    func audionghi(){
        do{
            if let assetUrl = NSDataAsset(name: "timenghi"){
                audioPlay = try AVAudioPlayer(data: assetUrl.data)
                audioPlay?.play()
            }
//            if let fileUrl = Bundle.main.path(forResource: "timenghi", ofType: "mp3"){
//                audioPlay = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileUrl))
//                audioPlay?.play()
//            }
            
        }catch let error{
            print("error: \(error)")
        }
        
    }
    
    func audioDem(){
        do{
            if let assetUrl = NSDataAsset(name: "count2"){
                audioPlay = try AVAudioPlayer(data: assetUrl.data)
                audioPlay?.play()
            }
            //            if let fileUrl = Bundle.main.path(forResource: "timenghi", ofType: "mp3"){
            //                audioPlay = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileUrl))
            //                audioPlay?.play()
            //            }
            
        }catch let error{
            print("error: \(error)")
        }
    }
    
    func audioDone(){
        do{
            if let assetUrl = NSDataAsset(name: "welldone"){
                audioPlay = try AVAudioPlayer(data: assetUrl.data)
                audioPlay?.play()
            }
        }catch let error{
            print("error \(error)")
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playAct(_ sender: Any) {
        if status == true{
            LoopTime()
            status = false
            (sender as! UIButton).setTitle("Stop", for: .normal)
            (sender as! UIButton).backgroundColor = UIColor.red
        }else{
            timerLoop?.invalidate()
            timer?.invalidate()
            setWhileStartView()
            status = true
            (sender as! UIButton).setTitle("Start", for: .normal)
            (sender as! UIButton).backgroundColor = UIColor.init(red: 65/255, green: 179/255, blue: 255/255, alpha: 1)
            return
        }
        
    }
    
    func demTimeTap(){
        currentTime = setTime
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeCounter), userInfo: nil, repeats: true)
    }
    
    func LoopTime(){
        currentSet = set
        currentSet! -= 1
        setCounterLb.text = "\(currentSet!) Set left!"
        demTimeTap()
        timerLoop = Timer.scheduledTimer(timeInterval: (TimeInterval(setTime! + restTime!)), target: self, selector: #selector(updateLoopTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateLoopTimer(){
            currentSet! -= 1
            setCounterLb.text = "\(currentSet!) Set left!"
            demTimeTap()
    }
    
    @objc func updateTimeCounter(){
        timeCounterLb.text = "\(currentTime!)"
        navigationTimerLb.text = "\(currentTime!)"
        currentTime! -= 1
        
        if(currentTime! < 0){
            
            if(currentSet! == 0){
                timeCounterLb.textColor = UIColor.init(red: 65/255, green: 179/255, blue: 255/255, alpha: 1)
                timeCounterLb.text = "Done✔"
                navigationTimerLb.text = "Done✔"
                timerLoop?.invalidate()
                timer?.invalidate()
                audioDone()
                return
            }else if currentSet! > 0{
                timeCounterLb.textColor = UIColor.init(red: 51/255, green: 102/255, blue: 102/255, alpha: 1)
                timeCounterLb.text = "Break"
                navigationTimerLb.text = "Break"
                timer?.invalidate()
                return
            }
        }
        
        if(currentTime! > 9){
            audioDem()
            timeCounterLb.textColor = UIColor.init(red: 65/255, green: 179/255, blue: 255/255, alpha: 1)
        }
            
        if(currentTime! == 9){
            timeCounterLb.textColor = UIColor.init(red: 250/255, green: 70/255, blue: 50/255, alpha: 1)
            audionghi()
        }
        
    }
}
