import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_place/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapScreen(
      {super.key,
      this.initialLocation = const PlaceLocation(
          latitude: -22.9865538, longitude: -49.8549485, addrees: ''),
      this.isReadOnly = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;
  void _selectedPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
                onPressed: _pickedPosition == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickedPosition);
                      },
                icon: Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectedPosition,
        markers: (_pickedPosition == null && widget.isReadOnly)
            ? <Marker>[].toSet()
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position:
                      _pickedPosition ?? widget.initialLocation.toLatLng(),
                ),
              },
      ),
    );
  }
}
