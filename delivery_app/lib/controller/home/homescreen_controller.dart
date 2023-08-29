import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/pending.dart';
import 'package:delivery_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController{
  int currentpage = 0;
  List<Widget> listpage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const Settings(),
  ];

  List<Map<String, dynamic>> bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Settings", "icon": Icons.settings}
  ];

  @override
  changePage(int currentpage) {
    this.currentpage = currentpage;
    update();
  }
}