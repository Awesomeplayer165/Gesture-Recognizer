//
//  RotateVC.swift
//  gestureRecognizer
//
//  Created by Jacob Trentini on 8/14/21.
//

import UIKit

class RotateVC: UIViewController {
    
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture: UIRotationGestureRecognizer = {
            let gesture = UIRotationGestureRecognizer(target: self, action: #selector(didRotate(_:)))
            return gesture
        }()
        
        view.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func didRotate(_ gesture: UIRotationGestureRecognizer) {
        velocityLabel.text = "Velocity      = \(gesture.velocity)"
        rotationLabel.text = "Rotation     = \(gesture.rotation)"
        
        switch gesture.state {
        case .began:      stateLabel.text = "State           = Began"
        case .possible:   stateLabel.text = "State           = Possible"
        case .changed:    stateLabel.text = "State           = Changed"
        case .ended:      stateLabel.text = "State           = Ended"
        case .cancelled:  stateLabel.text = "State           = Cancelled"
        case .failed:     stateLabel.text = "State           = Failed"
        @unknown default: stateLabel.text = "State           = @unknown default!"
        }
    }


}

