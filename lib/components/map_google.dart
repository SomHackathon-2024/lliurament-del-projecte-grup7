import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:hack24/screens/pages/publication_screen.dart';
import 'package:hack24/services/get/locations.dart';
import 'package:provider/provider.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _mataro = CameraPosition(
    target: LatLng(41.54211, 2.4445),
    zoom: 13.5,
  );

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _mataro,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

/*Future<void> getPoints() async {
    List<dynamic> positions = await locations();

    Set<Marker> markers = positions.map((position) {
      double lat = positions[0][4];
      double lon = positions[0][5];
      LatLng pos = LatLng(lat, lon);

      //if (lat is List<double> && lat.length >= 2) {
        return Marker(
          markerId: MarkerId(position.toString()),
          position: pos,
          infoWindow: InfoWindow(
            title: 'Marker Title',
            snippet: 'Marker Description',
          ),
        );
      /*} else {
        return null;
      }*/
    }).whereType<Marker>().toSet();

    setState(() {
      _markers = markers;
    });
  };*/

  Future<void> getPoints() async {
    List<dynamic> positions = await locations();
    Set<Marker> markers = {};

    print(positions);

    for (var position in positions) {
      print(position);
      //if (position is List<double> && position.length >= 2) { not necessary, we already have the sql filter
      print(position[4]);
      print(position[5]);
      double lat = position[4];
      double lon = position[5];
      LatLng pos = LatLng(lat, lon);

      String desc = AppStrings.getString(
          Provider.of<ThemeProvider>(context, listen: false).locale,
          position[6].toString()
      ) ?? position[6].toString();

      Marker marker = Marker(
        markerId: MarkerId(position[3].toString()),
        position: pos,
        infoWindow: InfoWindow(
          title: position[0].toString(),
          snippet: desc,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    PublicationScreen(
                      contingut: position[0].toString(),
                      id: position[1] as int,
                      linkImg: position[2].toString(),
                      autor: position[3].toString(),
                      titol: position[4].toString(),
                    ),
              ),
            );
          },
        ),
      );
      markers.add(marker);
      //}
    }

    setState(() {
      _markers = markers;
    });
  }
}
