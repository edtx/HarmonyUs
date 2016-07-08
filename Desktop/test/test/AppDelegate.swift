//
//  AppDelegate.swift
//  test
//
//  Created by Jacob Dobson on 7/2/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//https://geo.itunes.apple.com/us/playlist/mood/idpl.daa2a689923d4562bf5650a96809f929?mt=1&app=music    --#mood playlist
//play Snoop-CoolAid -> myMusicPlayer.setQueueWithStoreIDs(["1125514985"])
//rickRoll -> myMusicPlayer.setQueueWithStoreIDs(["302053341"])

import UIKit
import StoreKit
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if MPMusicPlayerController.systemMusicPlayer().playbackState != .Playing {
            MPMusicPlayerController.systemMusicPlayer().setQueueWithQuery(MPMediaQuery.songsQuery())
            MPMusicPlayerController.systemMusicPlayer().shuffleMode = .Songs
            MPMusicPlayerController.systemMusicPlayer().play()
        }
        
        return true
    }
}


/*
 
 
 
 else {
 //            MPMusicPlayerController.systemMusicPlayer().skipToNextItem(); print("skipItem")
 //            MPMusicPlayerController.systemMusicPlayer().play()
 //        }
 
 
 //        print(0)
 //        class AppleMusicPlayer: NSObject {
 //            func request(productID: String) {
 //                SKCloudServiceController.requestAuthorization { status in
 //                    let controller = SKCloudServiceController()
 //                    controller.requestCapabilitiesWithCompletionHandler { capabilities, error in
 //                        if capabilities.contains(.AddToCloudMusicLibrary) || capabilities.contains(.MusicCatalogPlayback) {
 //                            MPMediaLibrary.defaultMediaLibrary().addItemWithProductID(productID) { entities, error in
 //                                MPMusicPlayerController.systemMusicPlayer().setQueueWithStoreIDs([productID])
 //                                MPMusicPlayerController.systemMusicPlayer().play()
 //                            }
 //                        }
 //                    }
 //                }
 //            }
 //        }
 //        MPMusicPlayerController.systemMusicPlayer().setQueueWithQuery(MPMediaQuery.songsQuery())
 //        MPMusicPlayerController.systemMusicPlayer().shuffleMode = .Songs
 //        MPMusicPlayerController.systemMusicPlayer().play()
 
 
 let storeIDsArray: [String] = []
 let amPlayer = AppleMusicPlayer()
 let appPlayer = MPMusicPlayerController.applicationMusicPlayer()
 let sPlayer = MPMusicPlayerController.systemMusicPlayer()
 let songsQuery = MPMediaQuery.songsQuery()
 let albumsQuery = MPMediaQuery.albumsQuery()
 let sectionQuery = MPMediaQuerySection.supportsSecureCoding()   //returns true for supportsSecureCoding
 
 
 
 
 func idQueue() {
 sPlayer.setQueueWithStoreIDs(["302053341", "721249928"])    //will play RickRoll, then Norah Jones - Come Away With Me
 sPlayer.play()
 return
 }
 if sPlayer.playbackState != .Playing {
 sPlayer.setQueueWithQuery(songsQuery)
 sPlayer.shuffleMode = .Songs
 sPlayer.play()
 } else if sPlayer.playbackState == .Playing {
 return true
 }
 
 
 

_Player.setQueueWithStoreIDs(["302053341"]) --> Will play RickRoll (plus and  and erase music queue
let myMediaQuery = MPMediaQuery.songsQuery() --> queries ipod library for song to play in queue when called
myMusicPlayer.setQueueWithQuery(myMediaQuery) --> starts new queue from songsQuery
myMusicPlayer.shuffleMode = .Songs --> shuffleMode set to songs (can have .Albums, .Artists, .Genres...)
musicPlayer.play() --> play from current state (exact point in queue and song)
MPMusicPlayerController.systemMusicPlayer().shuffleMode = .Default --> keeps shuffleMode at user's current (can change to .Songs, .Albums, .Off(alphabetical))

 
let artist = musicPlayer.nowPlayingItem!.albumArtist?.capitalizedString
print(artist)

#mood playlist embed link and player
<iframe src="//tools.applemusic.com/embed/v1/playlist/pl.daa2a689923d4562bf5650a96809f929?country=us" height="500px" width="100%" frameborder="0"></iframe>
 
 Norah Jones Direct Link to Come Away With Me (song)
 https://geo.itunes.apple.com/us/album/come-away-with-me/id721249531?i=721249928&mt=1&app=music
 
 
 */