//
//  VideoView.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/15/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {

    var videoLayer : AVPlayerLayer?
    var avPlayer: AVPlayer?
    var videoUrl:String?
    
    func setUrl(url:String){
        if let videoUrl = URL(string: url){
            avPlayer = AVPlayer(url: videoUrl)
            videoLayer = AVPlayerLayer(player: avPlayer)
            videoLayer?.frame = bounds
            videoLayer?.videoGravity = AVLayerVideoGravity.resize
            if let customLayer = self.videoLayer{
                layer.addSublayer(customLayer)
            }
        }
    }
    
    func play(){
       avPlayer?.play()
    }
}
