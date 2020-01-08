import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
class Map extends StatelessWidget {
  const Map({Key key}) : super(key: key);
  static double lng;
  static double ltd;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: Scaffold(
              body: ListView(
                children: <Widget>[
                  Center(child: Text('My current Location',style: TextStyle(fontSize: 30),)),
                  Container(
                    height: 300,
                    width: 20,
                    child: new FlutterMap(
                    options: new MapOptions(
                      minZoom: 14,
                      center: new LatLng(ltd,lng)
                    ),
                    layers: 
                    [new TileLayerOptions(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a','b','c'],
                    ),
                     MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 45,
                          height: 45,
                          point: new LatLng(ltd,lng),
                          builder: (context) => new Container(
                            child: Icon(Icons.home),
                          )
                        )
                      ]
                    )
                    ],
                    
                ),
                  ),
                ],
              )
      ),
    );
  }
}