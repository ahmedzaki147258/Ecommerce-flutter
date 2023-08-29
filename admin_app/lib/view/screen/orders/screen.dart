import 'package:admin_app/controller/orders/screen_controller.dart';
import 'package:admin_app/view/widget/orders/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text('Orders'),),
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: controller.listpage.elementAt(controller.currentpage),
        ));
  }
}
