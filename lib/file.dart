import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _currentPosition;
  double longitude;
  double lat;
  MapController control = new MapController();
  gotPermission() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position.longitude.toString());
    longitude = position.longitude;
    lat = position.latitude;
    Map.ltd = position.latitude;
    Map.lng = position.longitude;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            RaisedButton(
              color: Colors.blue,
              child: Text("My location", style: TextStyle(color: Colors.white),),
              onPressed: () {
                _getCurrentLocation();
                gotPermission();
                if (_currentPosition != null)
                Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
              },
            ),

            
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
