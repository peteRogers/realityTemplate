//
//  ViewController.swift
//  realityTemplate
//
//  Created by Peter Rogers on 21/01/2022.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load scene from reality composure
        let sceneAnchor = try! Experience.loadScene()
        
        // Add the scene anchor to the scene
        arView.scene.anchors.append(sceneAnchor)
        
       
//        sceneAnchor.actions.hitCube.onAction = {entity in
//            print("hit")
//            //sceneAnchor.notifications.hitCube.post()
//        }
    }
}
