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
    
    var newlyCreatedFace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayCenterWhenOpen = trayView.center
        trayCenterWhenClosed = CGPoint(x: trayView.center.x, y: trayView.center.y + 200)
    }
    
    @IBAction func onPanEmoji(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        //let translation = panGestureRecognizer.translation(in: self.view)
        let point = panGestureRecognizer.location(in: self.view)
        
        switch panGestureRecognizer.state {
        case .began:
            let imageView = panGestureRecognizer.view as! UIImageView
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            // Add the new face to the tray's parent view. 
            view.addSubview(newlyCreatedFace)
            // Initialize the position of the new face. 
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
        case .changed:
            newlyCreatedFace.center = CGPoint(x: point.x , y:  point.y)
            break;
        case .ended:
            break
        default:break
        }
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

