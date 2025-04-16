import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxSet<Marker> markers = <Marker>{}.obs;
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  List<LatLng> coordinates = [
    // LatLng(23.85157452774604, 46.19607787245396), // Saudi
    LatLng(9.949208184680247, 76.28981649000104), // Kochi
    LatLng(8.892504224775292, 76.6194063208275), // Thiruvananthapuram
    LatLng(11.266602804066853, 75.77895225222007), // Kozhikode
    LatLng(11.877321543458152, 75.35370329302698), // Kannur
    // Additional locations in Kerala
    LatLng(9.9816, 76.2999), // Ernakulam
    LatLng(10.5276, 76.2144), // Thrissur
    LatLng(9.5941, 76.5222), // Kottayam
    LatLng(9.2876, 76.5723), // Pathanamthitta
    LatLng(8.5121, 76.9561), // Varkala
    LatLng(10.0159, 76.3419), // Aluva
    LatLng(10.7920, 76.6368), // Palakkad
    LatLng(8.8932, 76.6141), // Kovalam
    LatLng(9.1527, 76.7345), // Adoor
    LatLng(10.5570, 76.1423), // Guruvayur
    LatLng(9.7440, 76.5212), // Vaikom
    LatLng(11.2550, 75.7754), // Beypore
    LatLng(9.8500, 76.9000), // Munnar
    LatLng(10.3667, 76.1667), // Chalakudy
    LatLng(9.2667, 76.7833), // Punalur
    LatLng(10.8505, 76.2711), // Malappuram
    LatLng(10.1092, 77.0613), // Thekkady
    LatLng(9.5883, 76.5812), // Kumarakom
  ];
 
  @override
  void onInit() {
    super.onInit();
    // _addMarkers();
  }
 
  // void _addMarkers() {
  //   markers.clear();
  //   for (var i = 0; i < coordinates.length; i++) {
  //     markers.add(
  //       Marker(
  //         markerId: MarkerId(i.toString()),
  //         position: coordinates[i],
  //         infoWindow: InfoWindow(title: "Marker ${i + 1}"),
  //         onTap: () => onMarkerTapped(i),
  //       ),
  //     );
  //   }
  // }
 
  // void onMarkerTapped(int index) {
  //   Get.to(
  //     () => MarkerDetailsScreen(
  //       title: "Marker ${index + 1}",
  //       position: coordinates[index],
  //     ),
  //   );
  // }
 
  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }
 
  void onMapTapped(LatLng latLng) {
    selectedLocation.value = latLng;
    Get.back();
  }
}