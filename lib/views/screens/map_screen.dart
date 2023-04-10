import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_villa_france/controllers/mapController.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapController>(
          init: MapController(),
          builder: (controller) {
            return controller.loading.value ? Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: controller.initCameraPosition!,
                  markers: controller.markers,
                  onMapCreated: (ctrl) {
                    controller.mapController.complete(ctrl);
                  },
                  zoomControlsEnabled: false,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(20.h),
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.launchURL();
                        },
                        
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(40, 40),
                          maximumSize: Size(45.h, 45.h),
                          backgroundColor: Color.fromARGB(255, 22, 96, 255)
                        ),
                        child: Center(child: Icon(Icons.subdirectory_arrow_right_rounded)),
                      ),
                    ))
              ],
            ): Center(child: Text("loading..."),);
          }),
    );
  }
}
