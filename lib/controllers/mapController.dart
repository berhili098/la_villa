// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  CameraPosition? initCameraPosition;
  LatLng hotelPosition = LatLng(35.78305596383001, -5.81470053169067);
  Completer<GoogleMapController> mapController = Completer();
  Set<Marker> markers = {};
  LatLng? mainLocation;
  RxBool loading = false.obs;

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition().then((value) {
      mainLocation = LatLng(value.latitude, value.longitude);
    });
  }

  launchURL() async {
    String googleMapslocationUrl =
        "https://www.google.com/maps/dir/${mainLocation!.latitude},${mainLocation!.longitude}/Grand+H%C3%B4tel+Villa+de+France,+Rue+d'Angleterre,+Tangier/@${hotelPosition.latitude},${hotelPosition.longitude}";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      throw 'Could not launch $encodedURl';
    }
  }

  @override
  void onInit() async {
    await getLocation();
    initCameraPosition = CameraPosition(target: hotelPosition, zoom: 14);
    markers.add(Marker(markerId: MarkerId('id-1'), position: hotelPosition));
    loading.toggle();
    update();
    super.onInit();
  }
}
