import 'package:customerdata_sqflite/customer/controller/customerController.dart';
import 'package:customerdata_sqflite/customer/controller/googleMapsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  CustomerController controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(11.266602804066853, 75.77895225222007),
          initialZoom: 13.0,
          // center: LatLng(24.7136, 46.6753), // Default center (Riyadh)
          // zoom: 13.0,
          onTap: (tapPosition, point) {
            controller.selectedLocation.value = point;
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          if (controller.selectedLocation.value != null)
            Obx(() {
              final location = controller.selectedLocation.value;
              if (location == null) return const SizedBox();

              return MarkerLayer(
                markers: [
                  Marker(
                    point: location,
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              );
            }),
        ],
      ),

      // GoogleMap(
      //   onMapCreated: mapController.onMapCreated,
      //   initialCameraPosition: CameraPosition(
      //     target: mapController.coordinates.first,
      //     zoom: 10,
      //   ),
      //   markers: mapController.markers.toSet(),
      //   onTap: mapController.onMapTapped, // Capture tap location
      // ),
    );
  }
}
