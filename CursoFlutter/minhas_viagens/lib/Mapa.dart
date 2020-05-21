import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = {};

  _onMapCreated(GoogleMapController controller) {

    _controller.complete(controller);

  }

  _exibirMarcador(LatLng latlong){

    Marker marcador = Marker(
      markerId: MarkerId("marcador=${latlong.latitude}-${latlong.longitude}"),
      position: latlong,
      infoWindow: InfoWindow(
        title: "Marcador"
      ),
    );

    print("Marcador: " + marcador.markerId.toString());

    setState(() {
      _marcadores.add(marcador);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Container(
        child: GoogleMap(
          markers: _marcadores,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(0.020899, -51.056298),
            zoom: 18
          ),
          onMapCreated: _onMapCreated,
          onLongPress: _exibirMarcador,
        ),
      ),
    );
  }
}