import 'package:delivery_app/controller/home/settings_controller.dart';
import 'package:delivery_app/core/constant/color.dart';
import 'package:delivery_app/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(children: [
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: Get.width / 3, color: AppColor.primaryColor,
          ),
          Positioned(
              top: Get.width / 3.9,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: CircleAvatar(radius: 40, backgroundColor: Colors.grey[100], backgroundImage: const AssetImage(AppImageAsset.avatar),))),

        ],),
      const SizedBox(height: 100),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(onTap: () {},
              trailing: const Icon(Icons.help_outline_rounded),
              title: const Text("About us"),
            ),
            const Divider(),
            ListTile(onTap: () async{
              await launchUrl(Uri.parse("tel: phonenumber"));
            },
              trailing: const Icon(Icons.phone_callback_outlined),
              title: const Text("Contact us"),
            ),
            const Divider(),
            ListTile(
              onTap: () {controller.logout();},
              title: const Text("Logout"),
              trailing: const Icon(Icons.exit_to_app),
            ),
          ],),),
      ),
    ],);
  }
}
