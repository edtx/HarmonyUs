//
//  MusicPlayerrViewController.swift
//  test
//
//  Created by Jacob Dobson on 7/8/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit
import MediaPlayer
import StoreKit

class MusicPlayerViewController: UIViewController {


    
    let sPlayer = MPMusicPlayerController.systemMusicPlayer()
    
//    func blur() {
//        let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        let blurView = UIVisualEffectView(effect: lightBlur)
//        blurView.frame = nowPlayingItemBackgroundBlurredImageView.bounds
//    }
    
//    @IBAction func actionButton(sender: UIButton) {
//        let currentTitle = sender.currentTitle!
//        switch currentTitle {
//        case "forwardButton":
//            sPlayer.skipToNextItem()
//            //playOutlet.setTitle("PAUSE", forState: .Normal)
//            
//        case "play":
//            sPlayer.play()
////            sender.setTitle("PAUSE", forState: .Normal)
////            sender.hidden = true
//            
//        case "pasue":
//            sPlayer.pause()
////            sender.setTitle("PLAY", forState: .Normal)
////            sender.hidden = true
//        case "rewind":
//            sPlayer.skipToPreviousItem()
//            
//        default:break
//        }
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getNowPlayingItem), name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: nil)
        sPlayer.beginGeneratingPlaybackNotifications()
    }
    
    deinit {
        sPlayer.endGeneratingPlaybackNotifications()
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func getNowPlayingItem() {
        
        let albumArtwork = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemImageView.bounds.size)
        //let backgroundArtwork = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemBackgroundBlurredImageView.bounds.size)
        
        if sPlayer.playbackState == .Playing {
            
            artistLabel.text = sPlayer.nowPlayingItem?.albumArtist
            albumLabel.text = sPlayer.nowPlayingItem?.albumTitle
            songLabel.text = sPlayer.nowPlayingItem?.title
            
            if albumArtwork != nil {
                nowPlayingItemImageView.image = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemImageView.bounds.size)
                //nowPlayingItemBackgroundBlurredImageView.image = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemBackgroundBlurredImageView.bounds.size)
            } else if albumArtwork == nil {
                nowPlayingItemImageView.image = UIImage(named: "record")
            }
        } else if sPlayer.playbackState != .Playing {
            MPMusicPlayerController.systemMusicPlayer().setQueueWithQuery(MPMediaQuery.songsQuery())
            MPMusicPlayerController.systemMusicPlayer().shuffleMode = .Songs
            MPMusicPlayerController.systemMusicPlayer().play()
            artistLabel.text = sPlayer.nowPlayingItem?.albumArtist
            albumLabel.text = sPlayer.nowPlayingItem?.albumTitle
            songLabel.text = sPlayer.nowPlayingItem?.title
            if albumArtwork != nil {
                nowPlayingItemImageView.image = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemImageView.bounds.size)
            } else if albumArtwork == nil {
                nowPlayingItemImageView.image = UIImage(named: "record")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
