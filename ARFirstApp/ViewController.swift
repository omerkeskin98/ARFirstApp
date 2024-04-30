//
//  ViewController.swift
//  ARFirstApp
//
//  Created by Omer Keskin on 15.04.2024.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let moon = createSphere(radius: 0.15, content: "moonTexture", vector: SCNVector3(x: 0, y: 0.2, z: -1))
        let mars = createSphere(radius: 0.2, content: "marsTexture", vector: SCNVector3(x: 0.5, y: 0.2, z: -1))
        let sun = createSphere(radius: 0.5, content: "sunTexture", vector: SCNVector3(x: 1.5, y: 0.2, z: -1))
        
        sceneView.scene.rootNode.addChildNode(moon)
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(sun)
        sceneView.automaticallyUpdatesLighting = true
        
        
    }
    
    
    func createSphere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode{
        
        let newSphere = SCNSphere(radius: radius)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: content)
        newSphere.materials = [sphereMaterial]
        let node = SCNNode()
        node.position = vector
        node.geometry = newSphere

        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
