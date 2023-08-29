import 'package:user_app/controller/home_controller.dart';
import 'package:user_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(body,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
            ),
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
              top: -20,
              right: controller.lang == "en" ? -20 : null,
              left: controller.lang == "ar" ? -20 : null,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(140)),
              ))
        ],
      ),
    );
  }
}
