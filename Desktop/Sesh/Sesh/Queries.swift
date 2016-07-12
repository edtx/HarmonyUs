//
//  Queries.swift
//  Sesh
//
//  Created by Jacob Dobson on 7/5/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit
import MediaPlayer

//
//class Query: MPMediaQuery {
//
//    let player = MPMusicPlayerController.systemMusicPlayer()
//    let songQueryItems = MPMediaQuery.songsQuery()
//    let songQuery = MPMediaQuery.songsQuery()
//    let artistQuery = MPMediaQuery.artistsQuery()
//    let mediaItem = MPMediaItem()
//    
//    func getSongItems() {
//        let songCollection = MPMediaItemCollection(items: songQuery.items!)
//        player.setQueueWithItemCollection(songCollection)
//        player.play()
//    }
//    
//    func getArtistCollection() {
//        let artistPredicate = MPMediaPropertyPredicate(value: MPMediaItemPropertyArtistPersistentID, forProperty: MPMediaItemPropertyArtist)
//        artistQuery.filterPredicates = NSSet(object: artistPredicate) as? Set<MPMediaPredicate>
//        
//        let artistCollection = MPMediaItemCollection(items: artistQuery.items!)
//        player.setQueueWithItemCollection(artistCollection)
//        player.play()
//        
//    }

//    func getStoreIDCollection() {
//        let storePred = MPMediaPropertyPredicate(value: MPMediaPropertyPredicate)
//    }