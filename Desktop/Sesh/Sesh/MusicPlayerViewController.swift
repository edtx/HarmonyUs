//
//  MusicPlayerViewController.swift
//  Sesh
//
//  Created by Jacob Dobson on 7/8/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit
import MediaPlayer
import StoreKit

class MusicPlayerViewController: UIViewController {
        
    @IBOutlet var backgroundView: AnyObject!
    @IBOutlet weak var albumView: UIImageView!
    @IBOutlet weak var songText: UITextView!
    @IBOutlet weak var artistText: UITextView!
    @IBOutlet weak var albumText: UITextView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var queueButton: UIButton!

    let player = MPMusicPlayerController.systemMusicPlayer()
    let songQuery = MPMediaQuery.songsQuery()
    
    @IBAction func controlAction(sender: UIButton) {
        
        let currentTitle = sender.isKindOfClass(UIButton)
        
        switch currentTitle {
        case shuffleButton:
            player.setQueueWithQuery(songQuery)
            player.shuffleMode = .Songs
            player.play()
            playPauseButton.setTitle("pause", forState: .Selected)
        case backButton:
            player.skipToPreviousItem()
            playPauseButton.setTitle("pause", forState: .Selected)
        case forwardButton:
            player.skipToNextItem()
            playPauseButton.setTitle("pause", forState: .Selected)

        case playPauseButton:
            if player.playbackState == .Playing {
                player.pause()
                sender.setTitle("pause", forState: .Selected)
            } else if player.playbackState != .Playing {
                player.play()
                sender.setTitle("play", forState: .Normal)
            }

//        case "pause":
//            player.pause()
//            sender.setTitle("play", forState: .Normal)
            
        default:break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getNowPlayingItem), name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: nil)
        player.beginGeneratingPlaybackNotifications()
    }
    
    deinit {
        player.endGeneratingPlaybackNotifications()
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func getNowPlayingItem() {
        
        let nowPlaying = player.nowPlayingItem!
        //let backgroundImage = backgroundView.player.nowPlayingItem!.artwork?.imageWithSize(self.view.bounds.size)

        if player.playbackState == .Playing {
            albumView.image = nowPlaying.artwork?.imageWithSize(albumView.bounds.size)
            //backgroundView.image = nowPlaying.artwork?.imageWithSize(albumView.bounds.size)
                //= nowPlaying!.artwork?.imageWithSize(backgroundView.bounds.size)
            songText.text = nowPlaying.title
            artistText.text = nowPlaying.artist
            albumText.text = nowPlaying.albumTitle
        } else if player.playbackState != .Playing {
            albumView.image = nowPlaying.artwork?.imageWithSize(albumView.bounds.size)
            //backgroundImage
            songText.text = nowPlaying.title
            artistText.text = nowPlaying.artist
            albumText.text = nowPlaying.albumTitle
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
