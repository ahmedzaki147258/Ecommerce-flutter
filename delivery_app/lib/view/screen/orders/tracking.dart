import '../../../controller/orders/tracking_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrdersTracking extends StatelessWidget {
  const OrdersTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Tracking'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: GoogleMap(
                          polylines: controller.polylineSet,
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.gmc = controllermap;
                          },
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 40,
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: AppColor.primaryColor,
                      textColor: Colors.white,
                      minWidth: 300,
                      onPressed: (){
                        controller.doneDelivery();
                      }, child: const Text('The Order has been delivered'),),)
                ])))),
      ),
    );
  }
}