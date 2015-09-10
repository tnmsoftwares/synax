//
//  FirstViewController.swift
//  synax
//
//  Created by TNM3 on 8/18/15.
//  Copyright (c) 2015 TNM3. All rights reserved.
//

import UIKit
let ViewControllerVideoPath = "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4"

class FirstViewController: UIViewController , PlayerDelegate{

    @IBOutlet var playerView : UIView!
    private var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.autoresizingMask = (UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight)
        
        self.player = Player()
        self.player.delegate = self
        self.player.view.frame = self.playerView.bounds
        
        self.addChildViewController(self.player)
        self.playerView.addSubview(self.player.view)
        self.player.didMoveToParentViewController(self)
        
        self.player.path = ViewControllerVideoPath
        
        self.player.playbackLoops = true
        
        var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTapGestureRecognizer:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.player.playFromBeginning()
    }
    
    // MARK: UIGestureRecognizer
    
    func handleTapGestureRecognizer(gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.Stopped.rawValue:
            self.player.playFromBeginning()
        case PlaybackState.Paused.rawValue:
            self.player.playFromCurrentTime()
        case PlaybackState.Playing.rawValue:
            self.player.pause()
        case PlaybackState.Failed.rawValue:
            self.player.pause()
        default:
            self.player.pause()
        }
    }
    
    // MARK: PlayerDelegate
    
    func playerReady(player: Player) {
    }
    
    func playerPlaybackStateDidChange(player: Player) {
        
    }
    
    func playerBufferingStateDidChange(player: Player) {
        //did change state
//        println(player.maximumDuration)
//        println(player.currentDuration)
    }
    
    func playerPlaybackWillStartFromBeginning(player: Player) {

    }
    
    func playerPlaybackDidEnd(player: Player) {
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

