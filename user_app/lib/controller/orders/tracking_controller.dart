import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/core/class/statusrequest.dart';
import 'package:user_app/core/functions/polyline.dart';
import 'package:user_app/core/services/services.dart';
import 'package:user_app/data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  Set<Polyline> polylineSet ={};
  GoogleMapController? gmc;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  MyServices myServices = Get.find();

  double? destlat, destlong, currentlat, currentlong;

  intialData() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));

  }
  
  getLocationDelivery(){
    FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId.toString()).snapshots().listen((event) {
     if(event.exists){
       destlat = event.get("lat");
       destlong = event.get("long");
       updateMarkerDelivery(destlat!, destlong!);
    }
    });
  }

  updateMarkerDelivery(double newlat, double newlong){
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(newlat, newlong)));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getLocationDelivery();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}
