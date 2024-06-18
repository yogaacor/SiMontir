import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PetaPesanPage extends StatefulWidget {
  @override
  _PetaPesanPageState createState() => _PetaPesanPageState();
}

class _PetaPesanPageState extends State<PetaPesanPage> {
  GoogleMapController? _mapController; 
  LatLng _currentLocation = LatLng(-6.966667, 110.416664); 
  LatLng _selectedLocation = LatLng(-6.966667, 110.416664); 

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      _currentLocation = LatLng(_locationData.latitude!, _locationData.longitude!);
      _selectedLocation = _currentLocation;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: MarkerId('selectedLocation'),
                position: _selectedLocation,
                draggable: true,
                onDragEnd: (LatLng position) {
                  setState(() {
                    _selectedLocation = position;
                  });
                },
              ),
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _onEditLocation,
              child: Text('Edit'),
            ),
          ),
        ],
      ),
    );
  }

  void _onEditLocation() {
    // Handle edit location button press
  }
}
