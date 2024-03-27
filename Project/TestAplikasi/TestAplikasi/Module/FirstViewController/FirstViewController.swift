//
//  FirstViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//

import UIKit
import MapKit
import CoreLocation

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

class FirstViewController: BaseViewController {


    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var searchField: UITextField!

    @IBOutlet weak var searchButton: UIButton!

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLocation()
        car.start()
      

    }

    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapView.addGestureRecognizer(tapGesture)
        searchField.delegate = self
        mapView.delegate = self
    }

    func setup() {
        let initialDate = datePicker.date

        // You can format the initialDate to a string if needed
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let formattedDate = dateFormatter.string(from: initialDate)
        dateLabel.text = formattedDate

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let formattedTime = timeFormatter.string(from: initialDate)

        timeLabel.text = formattedTime


    }

    @IBAction func handleSelectedDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM yyyy"

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"

        let selectedDate = dateFormatter.string(from: sender.date)
        let selectedTime = timeFormatter.string(from: sender.date)

        dateLabel.text = selectedDate
        timeLabel.text = selectedTime
    }

    @IBAction func geocodeAddress(_ sender: Any) {
        guard let address = searchField.text else {
            // Handle the case where the text field is empty
            return
        }

        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                let location = placemark.location
                let coordinate = location?.coordinate

                print("Latitude: \(coordinate?.latitude ?? 0.0), Longitude: \(coordinate?.longitude ?? 0.0)")
                // Center the map around the specified coordinates

               let center = CLLocationCoordinate2D(latitude: coordinate?.latitude ?? 0.0, longitude: coordinate?.longitude ?? 0.0)
               let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
               self.mapView.setRegion(region, animated: true)

            }
        }
    }

    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            let locationInView = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
            print("Latitude cuy: \(coordinate.latitude), Longitude cuy: \(coordinate.longitude)")

            geocoder.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)) { (placemarks, error) in
                  if let error = error {
                      print("Reverse geocoding error: \(error.localizedDescription)")
                      return
                  }

                  if let placemark = placemarks?.first {
                      if let city = placemark.locality, let village = placemark.subLocality {
                          print("City: \(city), Village: \(village)")
                          let annotation = CustomAnnotation(coordinate: coordinate, title: city, subtitle: village)

                          self.mapView.addAnnotation(annotation)
                      }
                  }
              }


        }
    }
}

extension FirstViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: true)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}


extension FirstViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
              return nil // Return nil to use the default blue dot for user location
          }

          let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")
          annotationView.tintColor = .red // Customize the pin color
          annotationView.canShowCallout = true
          annotationView.animatesWhenAdded = true // Animate the pin drop

          let detailButton = UIButton(type: .detailDisclosure)
          annotationView.rightCalloutAccessoryView = detailButton

          return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
          // Handle the accessory control tap event (e.g., show more details)
          if let customAnnotation = view.annotation as? CustomAnnotation {
              print("Tapped Custom Annotation at Latitude: \(customAnnotation.coordinate.latitude), Longitude: \(customAnnotation.coordinate.longitude)")
          }
      }

}

extension FirstViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when "Return" key is pressed
        textField.resignFirstResponder()

        // Perform your action here
        if let text = textField.text {
            geocoder.geocodeAddressString(text) { (placemarks, error) in
                if let error = error {
                    print("Geocoding error: \(error.localizedDescription)")
                    return
                }

                if let placemark = placemarks?.first {
                    let location = placemark.location
                    let coordinate = location?.coordinate

                    print("Latitude: \(coordinate?.latitude ?? 0.0), Longitude: \(coordinate?.longitude ?? 0.0)")
                    // Center the map around the specified coordinates

                   let center = CLLocationCoordinate2D(latitude: coordinate?.latitude ?? 0.0, longitude: coordinate?.longitude ?? 0.0)
                   let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    self.mapView.setRegion(region, animated: true)

                }
            }

        }

        return true
    }

}
