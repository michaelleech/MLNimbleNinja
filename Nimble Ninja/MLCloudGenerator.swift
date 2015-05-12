//
//  MLCloudGenerator.swift
//  Nimble Ninja
//
//  Created by Michael Leech on 1/30/15.
//  Copyright (c) 2015 CrashCourseCode. All rights reserved.
//

import Foundation
import SpriteKit

class MLCloudGenerator: SKSpriteNode {
    
    let CLOUD_WIDTH: CGFloat = 125.0
    let CLOUD_HEIGHT: CGFloat = 55.0
    
    var generationTimer: NSTimer!
    
    func populate(num: Int) {
        for var i = 0; i < num; i++ {
            let cloud = MLCloud(size: CGSizeMake(CLOUD_WIDTH, CLOUD_HEIGHT))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width/2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
            cloud.position = CGPointMake(x, y)
            cloud.zPosition = -1
            addChild(cloud)
        }
    }
    
    func startGeneratingWithSpawnTime(seconds: NSTimeInterval) {
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generateCloud", userInfo: nil, repeats: true)
    }
    
    func stopGenerating() {
        generationTimer.invalidate()
    }
        
    func generateCloud() {
        let x = size.width/2 + CLOUD_WIDTH/2
        let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
        let cloud = MLCloud(size: CGSizeMake(CLOUD_WIDTH, CLOUD_HEIGHT))
        cloud.position = CGPointMake(x, y)
        cloud.zPosition = -1
        addChild(cloud)
    }
    
}