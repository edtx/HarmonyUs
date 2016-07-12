//
//  Authorization.swift
//  Sesh
//
//  Created by Jacob Dobson on 7/5/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//


import StoreKit
import MediaPlayer
import UIKit

class AppleMusicPlayer: NSObject {
    
    let appPlayer = MPMusicPlayerController.systemMusicPlayer()
    
    func playID(productID: String) {
        SKCloudServiceController.requestAuthorization { status in
            let controller = SKCloudServiceController()
            controller.requestCapabilitiesWithCompletionHandler { capabilities, error in
                if capabilities.contains(.AddToCloudMusicLibrary) || capabilities.contains(.MusicCatalogPlayback) {
                    MPMediaLibrary.defaultMediaLibrary().addItemWithProductID(productID) { entities, error in
                        self.appPlayer.setQueueWithStoreIDs([productID])
                        self.appPlayer.shuffleMode = .Songs
                        self.appPlayer.play()
                    }
                }
            }
        }
    }
}

//class StorefrontAssistant: NSObject {
//    
//    class func countryCode(completionHandler: ((countryCode: String?, error: NSError?) -> Void)) {
//        
//        
//        SKCloudServiceController.requestAuthorization { (status) in
//            if status != SKCloudServiceAuthorizationStatus.Authorized {
//                completionHandler(countryCode: nil, error: NSError(domain: "SKCloudServiceController", code: 401, userInfo: [NSLocalizedDescriptionKey: "Not authorized to access Apple Music.", "SKCloudServiceAuthorizationStatus": NSNumber(integer:status.rawValue)]))
//                return
//            }
//            
//            let controller = SKCloudServiceController()
//            controller.requestStorefrontIdentifierWithCompletionHandler({ (identifier, error) in
//                if let error = error {
//                    completionHandler(countryCode: nil, error: error)
//                    return
//                }
//                
//                guard let identifier = identifier?.componentsSeparatedByString(",").first?.componentsSeparatedByString("-").first
//                    else {
//                        completionHandler(countryCode: nil, error: NSError(domain: "SKCloudServiceController", code: 404, userInfo: [NSLocalizedDescriptionKey: "No identifier returned from SKCloudServiceController"]))
//                        return
//                }
//                print(identifier)
//                
//                guard let url = NSBundle.mainBundle().URLForResource("region", withExtension: "json"), storefronts = NSDictionary(contentsOfURL: url) else {
//                    completionHandler(countryCode: nil, error: NSError(domain: "StorefrontAssistant", code: 500, userInfo: [NSLocalizedDescriptionKey: "Could not load region.json"]))
//                    return
//                }
//                print(url)
//                
//                guard let code = storefronts[identifier] as? String else {
//                    completionHandler(countryCode: nil, error: NSError(domain: "StorefrontAssistant", code: 500, userInfo: [NSLocalizedDescriptionKey: "Could not find a country code for \(identifier)"]))
//                    return
//                }
//                print(code)
//                
//                completionHandler(countryCode: code, error: nil)
//            })
//        }
//        StorefrontAssistant.countryCode { (region, error) in
//            if let error = error {
//                NSLog("Error: \(error)")
//            }
//            if let region = region {
//                NSLog("Country code: \(region)")
//            }
//        }
//    }
//}




//"You are not authorized to use this app yet! You must be signed into iCloud (can do so in settings) and allow Apple to add songs to iCloud (enable in settings/Music/Library/ by turning on 'iCloud Music Library').
