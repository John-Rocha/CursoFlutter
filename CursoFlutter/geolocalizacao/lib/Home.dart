import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocalizacao/Home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /* Utilizado para definir que uma tarefa foi completada e utilizando 
  esse controller nós conseguiremos capturar o resultado do que foi executado */
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _posicaoCamera = CameraPosition(
    target: LatLng(0.002449, -51.065553),
    zoom: 19,
  );
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
        _posicaoCamera
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

  _recuperarLocalizacaoAtual() async {

    Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    setState(() {
      _posicaoCamera = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 17
      );
      _movimentarCamera();
    });
    //0.031822, -51.067440

    //print("Localização atual: " + position.toString());

  }

  _adicionarListenerLocalizacao(){

    var geolocator = Geolocator();
    var locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    geolocator.getPositionStream(locationOptions)
      .listen((Position position) {
        print("Localização atual: " + position.toString());

        Marker marcadorFortaleza = Marker(
          markerId: MarkerId("marcador-fortaleza"),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(
            title: "Meu local"
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueMagenta
          ),
          onTap: () {
            print("Meu local clicado");
          },
        );

        setState(() {
          //_marcadores.add(marcadorFortaleza);
          _posicaoCamera = CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 17
          );
          _movimentarCamera();
        });
      });

  }

  _recuperarLocalParaEndereco() async {

    List<Placemark> listaEnderecos = await Geolocator()
      .placemarkFromAddress("R. Jovino Dinoá, 3369");

      print("Total: " + listaEnderecos.toString());

      if (listaEnderecos != null && listaEnderecos.length > 0) {
        
        Placemark endereco = listaEnderecos[0];

        String resultado;

        resultado = "\n administrativeArea " + endereco.administrativeArea;
        resultado += "\n subAdministrativeArea " + endereco.subAdministrativeArea;
        resultado += "\n locality " + endereco.locality;
        resultado += "\n subLocality " + endereco.subLocality;
        resultado += "\n thoroughfare " + endereco.thoroughfare;        
        resultado += "\n subThoroughfare " + endereco.subThoroughfare;      
        resultado += "\n postalCode " + endereco.postalCode;     
        resultado += "\n country " + endereco.country;     
        resultado += "\n isoCountryCode " + endereco.isoCountryCode;     
        resultado += "\n position " + endereco.position.toString();     

        print("resultado: " + resultado);
        //Lat: 0.0218677, Long: -51.0609386

      }

  }

  _recuperarEnderecoParaLatLong() async {

    List<Placemark> listaEnderecos = await Geolocator()
      .placemarkFromCoordinates(0.0218677, -51.0609386);

      print("Total: " + listaEnderecos.toString());

      if (listaEnderecos != null && listaEnderecos.length > 0) {
        
        Placemark endereco = listaEnderecos[0];

        String resultado;

        resultado = "\n administrativeArea " + endereco.administrativeArea;
        resultado += "\n subAdministrativeArea " + endereco.subAdministrativeArea;
        resultado += "\n locality " + endereco.locality;
        resultado += "\n subLocality " + endereco.subLocality;
        resultado += "\n thoroughfare " + endereco.thoroughfare;        
        resultado += "\n subThoroughfare " + endereco.subThoroughfare;      
        resultado += "\n postalCode " + endereco.postalCode;     
        resultado += "\n country " + endereco.country;     
        resultado += "\n isoCountryCode " + endereco.isoCountryCode;     
        resultado += "\n position " + endereco.position.toString();     

        print("resultado: " + resultado);
        //Lat: 0.0218677, Long: -51.0609386

      }

  }

  @override
  void initState() {
    super.initState();
    //_carregarMarcadores();
    //_recuperarLocalizacaoAtual();
    //_adicionarListenerLocalizacao();
    //_recuperarLocalParaEndereco();
    _recuperarEnderecoParaLatLong();
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
          initialCameraPosition: _posicaoCamera,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          markers: _marcadores,
          // polygons: _polygons,
          // polylines: _polylines,
        ),
      ),
    );
  }
}