import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @State private var showScheduleScreen = false
    @State private var showScheduleRequestView = false
    @State private var showScheduleConfirm = false
    @State private var showTripPlanningView = false
    @State private var showTripConfirmationView = false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()

            if showScheduleScreen {
                ScheduleLocationView(mapState: $mapState, showScheduleScreen: $showScheduleScreen, showScheduleRequestView: $showScheduleRequestView)
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))
            }

            if showScheduleRequestView {
                ScheduleRequestView(showScheduleRequestView: $showScheduleRequestView, showScheduleConfirm: $showScheduleConfirm)
                    .environmentObject(locationViewModel)
            }
            
            if showScheduleConfirm {
                ScheduleConfirm(showScheduleConfirm: $showScheduleConfirm, selectedDate: Date())
                    .environmentObject(locationViewModel)
            }

            if showTripPlanningView {
                TripPlanningView(showTripConfirmationView: $showTripConfirmationView, showTripPlanningView: $showTripPlanningView)
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))
            }

            if showTripConfirmationView {
                TripConfirmationView(showTripConfirmationView: $showTripConfirmationView, destination: "---", tripDate: Date())
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))
            }

            if mapState == .searchingForLocation {
                LocationSearchView(mapState: $mapState)
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))
            }

            if mapState == .noInput && !showScheduleScreen && !showScheduleRequestView && !showScheduleConfirm && !showTripPlanningView && !showTripConfirmationView {
                BottomPanelView(mapState: $mapState, showScheduleScreen: $showScheduleScreen, showTripPlanningView: $showTripPlanningView)
                    .environmentObject(locationViewModel)
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                    .transition(.move(edge: .bottom))
            }

            MapViewActionButton(
                mapState: $mapState,
                showScheduleScreen: $showScheduleScreen,
                showScheduleRequestView: $showScheduleRequestView,
                showScheduleConfirm: $showScheduleConfirm,
                showTripPlanningView: $showTripPlanningView
            )
            .padding(.leading)
            .padding(.bottom, 720)


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
