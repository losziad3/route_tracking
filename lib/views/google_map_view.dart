import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:route_tracking/utils/location_service.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});


  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late CameraPosition initialCameraPosition;

  late LocationService locationService;
  late GoogleMapController googleMapController;
  Set<Marker> markers={};
  @override
  void initState(){
    initialCameraPosition = const CameraPosition(target: LatLng(0,0));
    locationService = LocationService();
    updateCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      onMapCreated: (controller){
        googleMapController = controller;
        updateCurrentLocation();
      },
      initialCameraPosition: initialCameraPosition,
    zoomControlsEnabled: false,
    );
  }

  void updateCurrentLocation() async{
    try {
      var locationData = await locationService.getLocation();
      LatLng currentPosition = LatLng(locationData.latitude!, locationData.longitude!);
      Marker currentLocationMarker = Marker(markerId: MarkerId('my-location'),
      position:currentPosition,
      );
      CameraPosition myCurrentCameraPosition = CameraPosition(target:currentPosition ,zoom: 14);
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(myCurrentCameraPosition));
      markers.add(currentLocationMarker);
      setState(() {});
    } on LocationServiceException {

    } on LocationPermissionException{

    }catch(e){

    }
  }
}
