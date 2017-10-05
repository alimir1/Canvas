//
//  ViewController.swift
//  Canvas
//
//  Created by Ali Mir on 10/4/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    var originalCenter: CGPoint!
    
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayCenterWhenOpen = trayView.center
        trayCenterWhenClosed = CGPoint(x: trayView.center.x, y: trayView.center.y + 200)
    }
    
    @IBAction func onTrayPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
//        let point = panGestureRecognizer.location(in: self.view)
        
        let translation = panGestureRecognizer.translation(in: self.view)
        let velocity = panGestureRecognizer.velocity(in: view)
        
        switch panGestureRecognizer.state {
        case .began:
            originalCenter = trayView.center
        case .changed:
            trayView.center = CGPoint(x: originalCenter.x, y: translation.y + originalCenter.y)
        case .ended:
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [], animations: {
                if velocity.y < 0 {
                    self.trayView.center = self.trayCenterWhenOpen
                } else {
                    self.trayView.center = self.trayCenterWhenClosed
                }
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        default: break
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

