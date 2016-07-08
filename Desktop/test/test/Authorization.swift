//
//  Authroization.swift
//  test
//
//  Created by Jacob Dobson on 7/3/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit
import StoreKit
import MediaPlayer

class AppleMusicPlayer: NSObject {
    
    let appPlayer = MPMusicPlayerController.systemMusicPlayer()
    
    func playID(productID: String) {
        SKCloudServiceController.requestAuthorization { status in
            let controller = SKCloudServiceController()
            controller.requestCapabilitiesWithCompletionHandler { capabilities, error in
                if capabilities.contains(.AddToCloudMusicLibrary) || capabilities.contains(.MusicCatalogPlayback) {
                    MPMediaLibrary.defaultMediaLibrary().addItemWithProductID(productID) { entities, error in
                        self.appPlayer.setQueueWithStoreIDs([productID]) ; print(productID)
                        self.appPlayer.shuffleMode = .Songs
                        self.appPlayer.play()
                    }
                }
            }
        }
    }
}


    
//    let musicPlayer = MPMusicPlayerController.systemMusicPlayer()
//    
//    func submitAppleMusicTrackWithProductID(productID: Int) -> Int {
//        let controller = SKCloudServiceController()
//        SKCloudServiceController.requestAuthorization((SKCloudServiceAuthorizationStatus) -> Void)
//            self.SKCloudServiceAuthorizationStatus(rawValue)
//            //cloudServiceController.requestStorefrontIdentifierWithCompletionHandler
//            
//        }
//    }
//}

//    struct CloudServiceCapability: OptionSetType {
//        let rawValue: Int
//        static var None: SKCloudServiceCapability = CloudServiceCapability(rawValue: 1 << 1)
//        static var MusicCatalogPlayback: SKCloudServiceCapability = CloudServiceCapability(rawValue: 2 << 2)
//        static var AddToCloudMusicLibrary: SKCloudServiceCapability = CloudServiceCapability(rawValue: 3 << 3)
//    }
//    
//    //var options: SKCloudServiceCapability = [.None, .MusicCatalogPlayback, .AddToCloudMusicLibrary]
//
//    class func submitAppleMusicTrackWithProductID(): String  {
//        SKCloudServiceController.requestAuthorization { (status: SKCloudServiceAuthorizationStatus) in
//            print("\(status)")
//            if status == SKCloudServiceAuthorizationStatus.Authorized {    // if not authorized...
//                //MPMusicPlayerController.systemMusicPlayer().skipToNextItem()
//                completionHandler(region: nil, error: NSError(domain: "SKCloudServiceController", code: 401, userInfo: [NSLocalizedDescriptionKey: "Not authorized to access Apple Music.", "SKCloudServiceAuthorizationStatus": NSNumber(integer:status.rawValue)]))
//                return
//            }
//            
//            SKCloudServiceController.requestStorefrontIdentifierWithCompletionHandler(SKCloudServiceCapability: capabilities, error: nil) {
//                
//            }
//            
//            
//            
//            
//            SKCloudServiceController().requestStorefrontIdentifierWithCompletionHandler({ (id, error) in
//                if let error = error {
//                    completionHandler(region: nil, error: error)
//                    return
//                }
//                guard let id = id?.componentsSeparatedByString(",").first?.componentsSeparatedByString("-").first else {
//                    completionHandler(region: nil, error: NSError(domain: "SKCloudServiceController", code: 404, userInfo: [NSLocalizedDescriptionKey: "No id returned from SKCloudServiceController"]))
//                    return
//                }
//                guard let url = NSBundle.mainBundle().URLForResource("StorefrontCountries", withExtension: "json"), storefronts = NSDictionary(contentsOfURL: url) else {
//                    completionHandler(region: nil, error: NSError(domain: "StorefrontAssistant", code: 500, userInfo: [NSLocalizedDescriptionKey: "Could not load StorefrontCountries"]))
//                    return
//                }
//                guard let code = storefronts[id] as? String else {
//                    completionHandler(region: nil, error: NSError(domain: "StorefrontAssistant", code: 500, userInfo: [NSLocalizedDescriptionKey: "Could not find a country code for \(id)"]))
//                    return
//                }
//                completionHandler(region: code, error: nil)
//            })
//        }
//        StoreFront.region { (region, error) in
//            if let error = error {
//                print("Error: \(error)")
//            }
//            if let region = region {
//                print("Country code: \(region)")
//            }
//        }
//    }
//}




//    enum MBGithubOAuthError: ErrorType
//    {
//        case MissingAccessToken(String)
//        case ExtractingTokenFromString(String)
//        case ExtractingTermporaryCode(String)
//        case ResponseFromGithub(String)
//    }


