import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class TrainmapWidget extends StatefulWidget {
  @override
  State<TrainmapWidget> createState() => TrainmapWidgetState();
}

class TrainmapWidgetState extends State<TrainmapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(53.28333, 69.4),
    zoom: 13.4746,
    
  );
  
  var marker = {Marker(
  markerId: MarkerId("id"), // a string for marker unique id

  position: LatLng(53.286152, 69.378506), // lat and long doubles

  onTap: () {
    //this is what you're looking for!
  },
  

),
Marker(
  markerId: MarkerId("id2"), // a string for marker unique id

  position: LatLng(53.284705, 69.369667), // lat and long doubles

  onTap: () {
    //this is what you're looking for!
  },
  

),
Marker(
  markerId: MarkerId("id3"), // a string for marker unique id

  position: LatLng(53.307087, 69.380777), // lat and long doubles

  onTap: () {
    //this is what you're looking for!
  },
  

),
Marker(
  markerId: MarkerId("id4"), // a string for marker unique id

  position: LatLng(53.279014, 69.377525), // lat and long doubles

  onTap: () {
    //this is what you're looking for!
  },
  

),
};
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: marker,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      
    );
  }

  
}