import SwiftUI

struct HomeView: View {
    
    @State private var mapState = MapViewState.noInput
    @State private var showScheduleScreen = false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()

            // Manage the visibility of ScheduleLocationView based on showScheduleScreen
            if showScheduleScreen {
                ScheduleLocationView(mapState: $mapState, showScheduleScreen: $showScheduleScreen)
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))  // Smooth transition for appearing
            }

            // Show LocationSearchView when searching for a location
            if mapState == .searchingForLocation {
                LocationSearchView(mapState: $mapState)
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))  // Consistent transition for both views
            }

            // BottomPanelView appears only when no other views are active
            if mapState == .noInput && !showScheduleScreen {
                BottomPanelView(mapState: $mapState, showScheduleScreen: $showScheduleScreen)
                    .environmentObject(locationViewModel)
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                    .transition(.move(edge: .bottom))
            }

            // Action button adjusted to accommodate the visibility of the schedule screen
            MapViewActionButton(mapState: $mapState, showScheduleScreen: $showScheduleScreen)
                .padding(.leading)
                .padding(.bottom, 720)


            // RideRequestView appears when a location is selected or a polyline is added
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        }
    }
}

