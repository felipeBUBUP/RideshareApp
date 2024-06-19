import SwiftUI

struct HomeView: View {
    
    @State private var mapState = MapViewState.noInput
    @State private var showScheduleScreen = false
    @State private var showScheduleRequestView = false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @State private var showScheduleConfirm = false
    @State private var selectedDate: Date = Date()

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
                ScheduleConfirm(showScheduleConfirm: $showScheduleConfirm, selectedDate: selectedDate)
                    .environmentObject(locationViewModel)
            }

            if mapState == .searchingForLocation {
                LocationSearchView(mapState: $mapState)
                    .environmentObject(locationViewModel)
                    .transition(.move(edge: .bottom))
            }

            if mapState == .noInput && !showScheduleScreen && !showScheduleRequestView && !showScheduleConfirm {
                BottomPanelView(mapState: $mapState, showScheduleScreen: $showScheduleScreen)
                    .environmentObject(locationViewModel)
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                    .transition(.move(edge: .bottom))
            }

            MapViewActionButton(
                mapState: $mapState,
                showScheduleScreen: $showScheduleScreen,
                showScheduleRequestView: $showScheduleRequestView,
                showScheduleConfirm: $showScheduleConfirm
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

