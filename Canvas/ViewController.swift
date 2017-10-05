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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTrayPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let point = panGestureRecognizer.location(in: self.view)
        
        let translation = panGestureRecognizer.translation(in: self.view)
        
        switch panGestureRecognizer.state {
        case .began:
            originalCenter = trayView.center
        case .changed:
            trayView.center = CGPoint(x: originalCenter.x, y: translation.y + originalCenter.y)
            break;
        case .ended:
            break;
        default:
            break;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

