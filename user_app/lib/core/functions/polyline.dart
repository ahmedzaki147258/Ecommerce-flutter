import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyLine(lat, long, destlat, destlong) async{
  Set<Polyline> polylineSet ={};
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  var url = "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyDJT_PEDS-jmgfu9tCRotDzoonVUjdCWOs";
  var reponse = await http.post(Uri.parse(url));
  var reponsebody = jsonDecode(reponse.body);
  var point = reponsebody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if(result.isNotEmpty){
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }

  Polyline polyline = Polyline(polylineId: PolylineId("ahmed"), color: Color(0xff3498db), width: 5, points: polylineco);
  polylineSet.add(polyline);
  return polylineSet;
}