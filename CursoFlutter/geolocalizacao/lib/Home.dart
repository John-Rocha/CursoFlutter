import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /* Utilizado para definir que uma tarefa foi completada e utilizando 
  esse controller nós conseguiremos capturar o resultado do que foi executado */
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = {};
  Set<Polygon> _polygons = {};
  Set<Polyline> _polylines = {};

  _onMapCreated(GoogleMapController googleMapController) {
    _controller.complete(googleMapController);    
  }

  _movimentarCamera() async {

    GoogleMapController googleMapController = await _controller.future;

    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(0.001827, -51.066055),
          zoom: 16,
          tilt: 0,
          bearing: 0,
        )
      ));
  }

  _carregarMarcadores() {
/* 
    Set<Marker> marcadoresLocal = {};

    Marker marcadorFortaleza = Marker(
      markerId: MarkerId("marcador-fortaleza"),
      position: LatLng(0.031326, -51.049234),
      infoWindow: InfoWindow(
        title: "Fortaleza de São José de Macapá"
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueMagenta
      ),
      onTap: () {
        print("Fortaleza");
      },
    );

    Marker marcadorShopping = Marker(
      markerId: MarkerId("marcador-shopping"),
      position: LatLng(0.031431, -51.063017),
      infoWindow: InfoWindow(
        title: "Shopping Macapá"
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue
      ),
    );

    marcadoresLocal.add(marcadorShopping);
    marcadoresLocal.add(marcadorFortaleza);

    setState(() {
      _marcadores = marcadoresLocal;
    });


    Set<Polygon> listaPolygons = {};
    Polygon polygon1 = Polygon(
      polygonId: PolygonId("polygon1"),
      fillColor: Colors.green,
      strokeColor: Colors.red,
      strokeWidth: 10,
      points: [
        LatLng(0.034147, -51.064399),
        LatLng(0.033986, -51.062382),
        LatLng(0.032152, -51.062436),
        LatLng(0.032345, -51.064549),
      ],
      consumeTapEvents: true,
      onTap: () {
        print("Clicado nessa área");
      },
    );

    Polygon polygon2 = Polygon(
      polygonId: PolygonId("polygon1"),
      fillColor: Colors.purple,
      strokeColor: Colors.orange,
      strokeWidth: 10,
      points: [
        LatLng(0.034147, -51.064399),
        LatLng(0.033986, -51.062382),
        LatLng(0.032152, -51.062436),
      ],
      consumeTapEvents: true,
      onTap: () {
        print("Clicado nessa área");
      },
    );

    listaPolygons.add(polygon1);
    listaPolygons.add(polygon2);

    setState(() {
      _polygons = listaPolygons;
    });

     */

    Set<Polyline> listaPolylines = {};
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.red,
      width: 10,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      jointType: JointType.bevel,
      points: [
        LatLng(0.001675, -51.066023),
        LatLng(0.002313, -51.066194),
        LatLng(0.002449, -51.065553)
      ],
      consumeTapEvents: true,
      onTap: () {
        print("Clicado nessa área");
      },
    );

    listaPolylines.add(polyline);

    setState(() {
      _polylines = listaPolylines;
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas e geolocalização"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: _movimentarCamera,
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          //Latitude e Longitude
          initialCameraPosition: CameraPosition(
            target: LatLng(0.002313, -51.066194),
            zoom: 19,
          ),
          onMapCreated: _onMapCreated,
          markers: _marcadores,
          polygons: _polygons,
          polylines: _polylines,
        ),
      ),
    );
  }
}