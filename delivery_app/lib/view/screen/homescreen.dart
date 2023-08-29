import 'dart:io';
import '../../controller/home/homescreen_controller.dart';
import 'package:delivery_app/core/constant/color.dart';
import 'package:delivery_app/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text('Orders'),),
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope( onWillPop: (){
            Get.defaultDialog(
                title: "warning",
                middleText: "Do you want to Exit the app",
                onConfirm: () => exit(0),
                onCancel: (){},
                titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                cancelTextColor: AppColor.secondColor,
                confirmTextColor: AppColor.secondColor,
                buttonColor: AppColor.thirdColor
            );
            return Future.value(false);
          },child: controller.listpage.elementAt(controller.currentpage),),
        ));
  }
}
