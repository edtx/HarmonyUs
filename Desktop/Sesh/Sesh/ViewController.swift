//
//  ViewController.swift
//  Sesh
//
//  Created by Jacob Dobson on 7/5/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

//import UIKit
//import MediaPlayer
//import StoreKit
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var nowPlayingItemImageView: UIImageView!
//    @IBOutlet weak var playOutlet: UIButton!
//    @IBOutlet weak var nextOutlet: UIButton!
//    @IBOutlet weak var nowPlayingItemLabel: UILabel!
//    @IBOutlet weak var nowPlayingArtistLabel: UILabel!
//    @IBOutlet weak var nowPlayingAlbumLabel: UILabel!
//    
//    let player = MPMusicPlayerController.systemMusicPlayer()
//    let productPlayer = AppleProductPlayer()
//    
//    @IBAction func actionButton(sender: UIButton) {
//        let currentTitle = sender.currentTitle
//        switch currentTitle! {
//        case "NEXT":
//            player.skipToNextItem()
//            //MPMusicPlayerControllerNowPlayingItemDidChangeNotification
//            playOutlet.setTitle("PAUSE", forState: .Normal)
//            
//        case "PLAY":
//            player.pause()
//            sender.setTitle("PAUSE", forState: .Normal)
//            sender.hidden = true
//            
//        case "PAUSE":
//            player.play()
//            sender.setTitle("PLAY", forState: .Normal)
//            sender.hidden = true
//            
//        default:break
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let nowPlaying = player.nowPlayingItem
//        if player.playbackState == .Playing {
//            nowPlayingItemImageView.image = nowPlaying!.artwork?.imageWithSize(nowPlayingItemImageView.bounds.size)
//            nowPlayingItemLabel.text = nowPlaying!.title!
//            nowPlayingArtistLabel.text = nowPlaying!.artist
//            nowPlayingAlbumLabel.text = nowPlaying!.albumTitle!
//            print(player.currentPlaybackRate)
//        }
//        while 1.0001 > player.currentPlaybackRate && player.currentPlaybackRate > 0.9999 {
//            print("1one")
//            //let nowPlaying = player.nowPlayingItem
//            if player.playbackState == .Playing {
//                nowPlayingItemImageView.image = player.nowPlayingItem!.artwork?.imageWithSize(nowPlayingItemImageView.bounds.size)
//                nowPlayingItemLabel.text = nowPlaying!.title!
//                nowPlayingArtistLabel.text = nowPlaying!.artist
//                nowPlayingAlbumLabel.text = nowPlaying!.albumTitle!
//            }
//        }
//    }
//    
//    func alignTextToTopLeftCorner() -> UITextView {
//        
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}

        
        
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getNowPlayingItem), name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: self.player)
//    }
    












//        let songQuery = MPMediaQuery.songsQuery().items
//        let songItemsCollection = MPMediaItemCollection(items: songQuery!)
//        player.setQueueWithItemCollection(songItemsCollection)
//        player.play()
