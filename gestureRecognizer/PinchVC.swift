//
//  PinchVC.swift
//  PinchVC
//
//  Created by Jacob Trentini on 8/14/21.
//

import UIKit

class PinchVC: UIViewController {
    
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture: UIPinchGestureRecognizer = {
            let gesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
            return gesture
        }()
        
        view.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func didPinch(_ gesture: UIPinchGestureRecognizer) {
        velocityLabel.text = "Velocity = \(gesture.velocity)"
        scaleLabel.text = "Scale     = \(gesture.scale)"
        
        switch gesture.state {
        case .began:      stateLabel.text = "State     = Began"
        case .possible:   stateLabel.text = "State     = Possible"
        case .changed:    stateLabel.text = "State     = Changed"
        case .ended:      stateLabel.text = "State     = Ended"
        case .cancelled:  stateLabel.text = "State     = Cancelled"
        case .failed:     stateLabel.text = "State     = Failed"
        @unknown default: stateLabel.text = "State     = @unknown default!"
        }
    }

}
