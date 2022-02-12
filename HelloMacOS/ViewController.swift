//
//  ViewController.swift
//  HelloMacOS
//
//  Created by SASAKI Iori on 2022/01/09.
//

import Cocoa
import MapKit
import CoreLocation

class ViewController: NSViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        // set region
        let center = CLLocationCoordinate2D(latitude: 39.716876, longitude: 140.129728)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(region, animated: false)
        self.mapView.regionThatFits(region)

        let overlay = MKTileOverlay(urlTemplate: "http://tile.openstreetmap.org/{z}/{x}/{y}.png")
        overlay.canReplaceMapContent = true
        self.mapView.addOverlay(overlay, level: .aboveLabels)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func didPushMyLocationButton(_ sender: NSButton) {
        print("did push my location button")
    }
    
    @IBAction func didPushUniversityButton(_ sender: NSButton) {
        print("did push university button")
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKTileOverlay {
            let renderer = MKTileOverlayRenderer(overlay: overlay)
            return renderer
        } else {
            return MKTileOverlayRenderer()
        }
    }
}
