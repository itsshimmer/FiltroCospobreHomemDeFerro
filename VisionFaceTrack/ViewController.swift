import UIKit
import Vision
import ARKit

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let nose = ["🐽", "👃"]

    @IBOutlet var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device")
        }
        sceneView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let config = ARFaceTrackingConfiguration()
        
        sceneView.session.run(config)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func updateFeatures(for node: SCNNode, using anchor: ARFaceAnchor) {
        let child = node.childNode(withName: "nose", recursively: false) as? ENode
        let vertices = [anchor.geometry.vertices[9]]
        child?.updatePosition(for: vertices)
    }
}
