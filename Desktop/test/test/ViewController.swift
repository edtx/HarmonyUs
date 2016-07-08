//
//  ViewController.swift
//  test
//
//  Created by Jacob Dobson on 7/2/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
// https://geo.itunes.apple.com/us/playlist/mood/idpl.daa2a689923d4562bf5650a96809f929?mt=1&app=music --> #mood

import UIKit
import MediaPlayer
import StoreKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nowPlayingItemLabel: UILabel!
    @IBOutlet weak var nowPlayingItemArtworkImageView: UIImageView!
    @IBOutlet weak var nowPlayingItemArtistLabel: UILabel!
    @IBOutlet weak var nowPlayingItemAlbumLabel: UILabel!
    
    let sPlayer = MPMusicPlayerController.systemMusicPlayer()
    
    //let applePlayer = AppleMusicPlayer()
    //lazy var lazyPlayer = MPMusicPlayerController.systemMusicPlayer()
    //let library = MPMediaLibrary.defaultMediaLibrary()    // build a MPMediaPropertyPredicate and MPMediaPropertyQuery to access library
    //let stateChanged = MPMusicPlayerControllerPlaybackStateDidChangeNotification
    //var currentIndex = MPMusicPlayerController.systemMusicPlayer().indexOfNowPlayingItem
    //let allSongItems = MPMediaQuery.songsQuery().items
    
    @IBAction func actionButton(sender: UIButton) {
        let currentTitle = sender.currentTitle ; print(currentTitle)
        
        switch currentTitle! {
        
        case "NEXT":
            if sPlayer.playbackState == .Playing {
                sPlayer.skipToNextItem()
                print("skip")
                playPauseButton.setTitle("PAUSE", forState: .Normal)
            } else if sPlayer.playbackState != .Playing {
                MPMusicPlayerController.systemMusicPlayer().setQueueWithQuery(MPMediaQuery.songsQuery())
                MPMusicPlayerController.systemMusicPlayer().shuffleMode = .Songs
                MPMusicPlayerController.systemMusicPlayer().play()
                playPauseButton.setTitle("PAUSE", forState: .Normal)
                print("playingFromNextButtonQuery")
            }
            //changing song information/image when sent to next song
//            nowPlayingItemArtistLabel.text = sPlayer.nowPlayingItem?.albumArtist
//            nowPlayingItemAlbumLabel.text = sPlayer.nowPlayingItem?.albumTitle
//            nowPlayingItemArtworkImageView.image = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemArtworkImageView.bounds.size)
//            nowPlayingItemLabel.text = sPlayer.nowPlayingItem?.title
        
        case "PLAY":
            sPlayer.play()
            sender.setTitle("PAUSE", forState: .Normal)
        
        case "PAUSE":
            sPlayer.pause()
            sender.setTitle("PLAY", forState: .Normal)
            
        default:break
        }
    }
    
    //lazy var playbackChange = MPMusicPlayerController.systemMusicPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getNowPlayingItem), name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: nil)
        print("generate")
        sPlayer.beginGeneratingPlaybackNotifications()
        print("notify set")
    }
    
    deinit {
        sPlayer.endGeneratingPlaybackNotifications()
        print("playbackNOtifications")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func getNowPlayingItem() {
        print("called getNowPlayingItem")
        //if sPlayer.playbackState == .Playing { print("isPlaying") }
        if sPlayer.playbackState == .Playing {
            print("nowPlayingItem not nil")
            //nowPlayingItemArtworkImageView.image = sPlayer.nowPlayingItem?[MPMediaItemPropertyArtwork]?.imageWithSize(nowPlayingItemArtworkImageView.bounds.size)
            
            nowPlayingItemArtistLabel.text = sPlayer.nowPlayingItem?[MPMediaItemPropertyArtist] as? String
            print("artist")
            nowPlayingItemAlbumLabel.text = sPlayer.nowPlayingItem?[MPMediaItemPropertyAlbumTitle] as? String
            nowPlayingItemLabel.text = sPlayer.nowPlayingItem?[MPMediaItemPropertyTitle] as? String
            //let duration = sPlayer.nowPlayingItem?[MPMediaItemPropertyPlaybackDuration] as? NSNumber
        } else if sPlayer.playbackState != .Playing {
            print("notPlaying")
            MPMusicPlayerController.systemMusicPlayer().setQueueWithQuery(MPMediaQuery.songsQuery())
            MPMusicPlayerController.systemMusicPlayer().shuffleMode = .Songs
            MPMusicPlayerController.systemMusicPlayer().play()
            nowPlayingItemArtistLabel.text = sPlayer.nowPlayingItem?.albumArtist
            print("artistLqabel")
            nowPlayingItemAlbumLabel.text = sPlayer.nowPlayingItem?.albumTitle
            nowPlayingItemArtworkImageView.image = sPlayer.nowPlayingItem?.artwork?.imageWithSize(nowPlayingItemArtworkImageView.bounds.size)
            nowPlayingItemLabel.text = sPlayer.nowPlayingItem?.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


//        if sPlayer.indexOfNowPlayingItem == 9223372036854775807 {
//            sPlayer.setQueueWithQuery(MPMediaQuery.songsQuery())
//            sPlayer.shuffleMode = .Songs
//            sPlayer.play()


//        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.direction))
//        recognizer.direction = .Left
//        self.view .addGestureRecognizer(recognizer)
//        while sPlayer.play() == true {
//            nowPlayingItemArtistLabel.text = sPlayer.nowPlayingItem!.albumArtist; print(sPlayer.currentPlaybackRate)
//            nowPlayingItemAlbumLabel.text = sPlayer.nowPlayingItem!.albumTitle
//            nowPlayingItemArtworkImageView.image = sPlayer.nowPlayingItem!.artwork!.imageWithSize(nowPlayingItemArtworkImageView.bounds.size)
//            nowPlayingItemLabel.text = sPlayer.nowPlayingItem!.title
//        }
//        
//        while sPlayer.currentPlaybackRate > 1 { print("moreThan1") }
//    }


        //while MPMusicPlayerControllerPlaybackStateDidChangeNotification {
//            sPlayer.
//        }
//        func beginGeneratingPlaybackNotifications() -> String {
//            return MPMusicPlayerControllerPlaybackStateDidChangeNotification
//        }



/*
 
 public enum SKCloudServiceAuthorizationStatus : Int {
 
 case NotDetermined
 case Denied
 case Restricted
 case Authorized
 }
 
 @available(iOS 9.3, *)
 public struct SKCloudServiceCapability : OptionSetType {
 public init(rawValue: UInt)
 
 public static var None: SKCloudServiceCapability { get }
 public static var MusicCatalogPlayback: SKCloudServiceCapability { get }
 public static var AddToCloudMusicLibrary: SKCloudServiceCapability { get }
 }
 
 @available(iOS 9.3, *)
 public class SKCloudServiceController : NSObject {
 
 public class func authorizationStatus() -> SKCloudServiceAuthorizationStatus
 public class func requestAuthorization(handler: (SKCloudServiceAuthorizationStatus) -> Void)
 
 public func requestStorefrontIdentifierWithCompletionHandler(completionHandler: (String?, NSError?) -> Void)
 public func requestCapabilitiesWithCompletionHandler(completionHandler: (SKCloudServiceCapability, NSError?) -> Void)
 }
 
 @available(iOS 9.3, *)
 public let SKStorefrontIdentifierDidChangeNotification: String
 @available(iOS 9.3, *)
 public let SKCloudServiceCapabilitiesDidChangeNotification: String
 
 
 
 
 
 */

/*
 
 [SKCloudServiceController requestAuthorization:^(SKCloudServiceAuthorizationStatus status) {
 NSLog(@"status is %ld", (long)status);
 SKCloudServiceController *cloudServiceController;
 cloudServiceController = [[SKCloudServiceController alloc] init];
 [cloudServiceController requestCapabilitiesWithCompletionHandler:^(SKCloudServiceCapability capabilities, NSError * _Nullable error) {
 NSLog(@"%lu %@", (unsigned long)capabilities, error);
 if (capabilities >= SKCloudServiceCapabilityAddToCloudMusicLibrary || capabilities==SKCloudServiceCapabilityMusicCatalogPlayback)
 {
 NSLog(@"You CAN add to iCloud!");
 [[MPMediaLibrary defaultMediaLibrary] addItemWithProductID:productID completionHandler:^(NSArray<__kindof MPMediaEntity *> * _Nonnull           entities, NSError * _Nullable error)
 {
 NSLog(@"added id%@ entities: %@ and error is %@", productID, entities, error);
 NSArray *tracksToPlay = [NSArray arrayWithObject:productID];
 [[MPMusicPlayerController applicationMusicPlayer] setQueueWithStoreIDs:tracksToPlay];
 [[MPMusicPlayerController applicationMusicPlayer] stop];
 [[MPMusicPlayerController applicationMusicPlayer] play];
 self.isTrackChangedByNextPreviousButton = NO;
 [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:nil];
 [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMusicPlayerControllerPlaybackStateDidChangeNotification object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(handleTrackChanged:)
 name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
 object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(handlePlaybackStateChanged:)
 name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
 object:nil];
 [[MPMusicPlayerController applicationMusicPlayer] beginGeneratingPlaybackNotifications];
 [[MPMusicPlayerController applicationMusicPlayer] setRepeatMode: MPMusicRepeatModeNone];
 }];
 }
 else
 {
 NSLog(@"Blast! The ability to add Apple Music track is not there. sigh.");
 }
 }];
 }];
 }
 -(void)handleTrackChanged:(id )notification
 {
 if (!self.AppleMusicPreviuosTrack)
 {
 self.AppleMusicPreviuosTrack = [[Tracks alloc] init];
 }
 if (self.AppleMusicPreviuosTrack.trackId == self.CurrentTrack.trackId && [MPMusicPlayerController applicationMusicPlayer].currentPlaybackRate == 0 && !self.isSongChangedManually)
 {
 self.isSongChangedManually = YES;
 [self FilterArtistsTracks:@"next" :^(Tracks *track, NSError *err)
 {
 }];
 }
 else
 {
 if ([[MPMusicPlayerController applicationMusicPlayer] currentPlaybackRate]==1)
 {
 self.AppleMusicPreviuosTrack.trackId = self.CurrentTrack.trackId;
 [[NSNotificationCenter defaultCenter] postNotificationName:kTrackChanged object:nil];
 /
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 30 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
 self.isSongChangedManually = NO;
 });
 }
 }
 }
 -(void)handlePlaybackStateChanged:(id )notification
 {
 NSLog(@"handle_PlaybackStateChanged");
 [[NSNotificationCenter defaultCenter] postNotificationName:kDidTrackPlaybackStatus object:nil];
 if ([MPMusicPlayerController applicationMusicPlayer].currentPlaybackRate>0)
 {
 [self.playerMenuView.playpauseButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
 }
 else
 {
 [self.playerMenuView.playpauseButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
 }
 }
 
 
 
 
 */





