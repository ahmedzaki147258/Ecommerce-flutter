import 'package:user_app/core/class/statusrequest.dart';
import 'package:user_app/core/functions/handingdatacontroller.dart';
import 'package:user_app/core/services/services.dart';
import 'package:user_app/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController  extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async{
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الي المفضلة "));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  removeFavorite(String itemsid) async{
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة "));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }
}
