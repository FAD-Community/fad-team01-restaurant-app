import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();

    _initialCamera = CameraPosition(
      target: LatLng(widget.restaurant.latitude, widget.restaurant.longitude),
      zoom: 18,
      tilt: 45,
      bearing: 25,
    );
  }

  Future<void> _moveToRestaurant() async {
    final controller = await _controller.future;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            widget.restaurant.latitude,
            widget.restaurant.longitude,
          ),
          zoom: 18,
          tilt: 45,
          bearing: 25,
        ),
      ),
    );

    setState(() {});
  }

  @override
  void didUpdateWidget(covariant MapSample oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.restaurant != widget.restaurant) {
      _moveToRestaurant();
    }
  }

  late CameraPosition _initialCamera;

  Set<Marker> get _markers => {
    Marker(
      markerId: MarkerId(widget.restaurant.name),
      position: LatLng(widget.restaurant.latitude, widget.restaurant.longitude),
      infoWindow: InfoWindow(
        title: widget.restaurant.name,
        snippet: widget.restaurant.category,
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialCamera,

          onMapCreated: (controller) {
            _controller.complete(controller);
          },

          markers: _markers,

          mapType: MapType.normal,

          myLocationEnabled: true,
          myLocationButtonEnabled: false,

          zoomControlsEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,

          trafficEnabled: false,
          buildingsEnabled: true,
          indoorViewEnabled: true,

          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,

          padding: const EdgeInsets.only(bottom: 250),
        ),

        /// Current Location Button
        Positioned(
          right: 16,
          bottom: 270,
          child: FloatingActionButton(
            heroTag: "location",
            mini: true,
            backgroundColor: Colors.white,
            elevation: 6,
            onPressed: _goToCurrentLocation,
            child: const Icon(Icons.my_location, color: Colors.black),
          ),
        ),

        /// Zoom In
        Positioned(
          right: 16,
          bottom: 340,
          child: FloatingActionButton(
            heroTag: "zoomIn",
            mini: true,
            backgroundColor: Colors.white,
            elevation: 6,
            onPressed: _zoomIn,
            child: const Icon(Icons.add, color: Colors.black),
          ),
        ),

        /// Zoom Out
        Positioned(
          right: 16,
          bottom: 410,
          child: FloatingActionButton(
            heroTag: "zoomOut",
            mini: true,
            backgroundColor: Colors.white,
            elevation: 6,
            onPressed: _zoomOut,
            child: const Icon(Icons.remove, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Future<void> _goToCurrentLocation() async {
    final controller = await _controller.future;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(30.798972689394006, 31.001215167470225),
          zoom: 17,
          tilt: 45,
          bearing: 25,
        ),
      ),
    );
  }

  Future<void> _zoomIn() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.zoomIn());
  }

  Future<void> _zoomOut() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.zoomOut());
  }
}
