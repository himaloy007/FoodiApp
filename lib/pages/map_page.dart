import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TapToAddMarkerMap extends StatefulWidget {
  const TapToAddMarkerMap({super.key});

  @override
  State<TapToAddMarkerMap> createState() => _TapToAddMarkerMapState();
}

class _TapToAddMarkerMapState extends State<TapToAddMarkerMap> {
  LatLng? _tappedPoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap to Place Marker")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(24.235810810751353, 89.89052985118198),
          initialZoom: 15.0,
          onTap: (tapPosition, point) {
            setState(() {
              _tappedPoint = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.dynamic_app',
          ),
          if (_tappedPoint != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: _tappedPoint!,
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
