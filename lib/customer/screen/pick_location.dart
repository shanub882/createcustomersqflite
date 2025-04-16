
import 'package:customerdata_sqflite/customer/controller/googleMapsController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
   MapController mapController = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        GoogleMap(
          onMapCreated: mapController.onMapCreated,
          initialCameraPosition: CameraPosition(
            target: mapController.coordinates.first,
            zoom: 10,
          ),
          markers: mapController.markers.toSet(),
          onTap: mapController.onMapTapped, // Capture tap location
        ),
      
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   child: Obx(() {
          //     final latLng = mapController.selectedLocation.value;
          //     return Text(
          //       latLng != null
          //           ? "Location: ${latLng.latitude}, ${latLng.longitude}"
          //           : "Tap on the map to select a location",
          //       style: const TextStyle(fontSize: 16),
          //     );
          //   }),
          // ),

    );
  }
}


// class MarkerDetailsScreen extends StatelessWidget {
//   final String title;
//   final LatLng position;
 
//   const MarkerDetailsScreen({super.key, required this.title, required this.position});
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Location: ${position.latitude}, ${position.longitude}",
//                 style: TextStyle(fontSize: 18)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Back to Map"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// },
   