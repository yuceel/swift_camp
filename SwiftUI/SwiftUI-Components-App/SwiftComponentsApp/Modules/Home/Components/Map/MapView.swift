import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var presenter: MapPresenter
    
    // Region that controls the map's center point and zoom level
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // San Francisco coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Zoom level
    )
    
    // Coordinates selected by the user
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    
    // Some initial pins to display on the map
    @State private var annotations = [
        MyAnnotation(title: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        MyAnnotation(title: "Golden Gate Bridge", coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783))
    ]
    
    var body: some View {
        VStack {
            // Button to go back
            HStack {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                }
                .padding(.leading)
                Spacer()
            }
            
            // Instruction text for the user on how to interact with the map
            Text("Long press on the map to select a location")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            // GeometryReader is used to get the size and position of the map
            GeometryReader { geometry in
                Map(
                    coordinateRegion: $region, // Track the map's region
                    annotationItems: annotations // Add pins to the map
                ) { annotation in
                    // Using MapAnnotation to place custom pins on the map
                    MapAnnotation(coordinate: annotation.coordinate) {
                        Image(systemName: "pin.circle.fill") // Custom pin image
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                }
                .frame(height: 400)
                .cornerRadius(15)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0) // Long press gesture
                        .onEnded { _ in
                            // When the long press is completed, this code runs
                            // Get the global coordinates of the press from GeometryReader
                            let location = geometry.frame(in: .global).origin
                            // Convert the global coordinates to map coordinates
                            let coordinate = convertToCoordinate(from: location, geometry: geometry)
                            // Update the selected coordinates and place a pin on the map
                            updateSelectedCoordinate(coordinate)
                        }
                )
            }
            .padding(.top, 20)
            
            // Display the selected coordinate information
            VStack(spacing: 20) {
                if let selectedCoordinate = selectedCoordinate {
                    Text("Selected Coordinate: \(selectedCoordinate.latitude), \(selectedCoordinate.longitude)")
                        .font(.headline)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                } else {
                    // If no coordinate is selected, show this message
                    Text("No location selected")
                        .font(.headline)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
        }
        .navigationBarHidden(true) // Hides the default navigation bar
        .padding()
    }
    
    // Helper function to convert the press location to map coordinates
    private func convertToCoordinate(from location: CGPoint, geometry: GeometryProxy) -> CLLocationCoordinate2D {
        let latDelta = region.span.latitudeDelta
        let lonDelta = region.span.longitudeDelta
        // Converts the X and Y coordinates of the press to actual map coordinates
        let lat = region.center.latitude + (Double(location.y) - Double(geometry.size.height / 2)) / latDelta
        let lon = region.center.longitude + (Double(location.x) - Double(geometry.size.width / 2)) / lonDelta
        return CLLocationCoordinate2D(latitude: lat, longitude: lon) // Return the coordinates
    }
    
    // Updates the selected coordinates and places a new pin on the map
    private func updateSelectedCoordinate(_ coordinate: CLLocationCoordinate2D) {
        selectedCoordinate = coordinate // Update the selected coordinates
        // Add the new pin to the annotations array
        annotations.append(MyAnnotation(title: "Selected Location", coordinate: coordinate))
    }
}

// Model for each pin to be displayed on the map
struct MyAnnotation: Identifiable {
    var id = UUID() // Unique ID for each pin
    var title: String // Title for the pin
    var coordinate: CLLocationCoordinate2D // Coordinates for the pin
}
