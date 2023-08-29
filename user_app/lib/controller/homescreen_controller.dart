import 'package:user_app/view/screen/home.dart';
import 'package:user_app/view/screen/notification.dart';
import 'package:user_app/view/screen/offers.dart';
import 'package:user_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController{
  int currentpage = 0;
  List<Widget> listpage = [
    const HomePage(),
    const NotificationView(),
    const OffersView(),
    const Settings(),
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notifications", "icon": Icons.notifications_active_outlined},
    {"title": "offers", "icon": Icons.local_offer_outlined},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int currentpage) {
    this.currentpage = currentpage;
    update();
  }

}