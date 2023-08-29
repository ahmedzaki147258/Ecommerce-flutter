import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/view/widget/home/cardadmin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: ListView(children: [
        GridView(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getValueForScreenType<int>(
                  context: context,
                  mobile: 3,
                  tablet: 4,
                  desktop: 5,
                  watch: 2
                ),
                mainAxisExtent: 150),
            children: [
              CardAdmin(title: "Categories", url: AppImageAsset.categories, onClick: (){Get.toNamed(AppRoute.categoriesview);},),
              CardAdmin(title: "Product", url: AppImageAsset.products, onClick: (){Get.toNamed(AppRoute.itemsview);},),
              CardAdmin(title: "Users", url: AppImageAsset.usres, onClick: (){},),
              CardAdmin(title: "Orders", url: AppImageAsset.orders, onClick: (){Get.toNamed(AppRoute.ordersscreen);},),
              CardAdmin(title: "Report", url: AppImageAsset.report, onClick: (){},),
              CardAdmin(title: "Logout", url: AppImageAsset.logout, onClick: (){
                MyServices myServices = Get.find();
                FirebaseMessaging.instance.unsubscribeFromTopic("services");
                myServices.sharedPreferences.clear();
                Get.offAllNamed(AppRoute.login);
              },),
            ],
        )
      ],),
    );
  }
}
