import 'package:user_app/controller/home_controller.dart';
import 'package:user_app/core/class/statusrequest.dart';
import 'package:user_app/core/constant/routes.dart';
import 'package:user_app/core/functions/handingdatacontroller.dart';
import 'package:user_app/core/services/services.dart';
import 'package:user_app/data/datasource/remote/items_data.dart';
import 'package:user_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemController extends GetxController{
  intialData();
  changeCat(int val, String catid);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? categoryid;
  String deliverytime = "";

  ItemsData itemsData = ItemsData(Get.find());
  List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    categoryid = Get.arguments['categoryid'].toString();
    deliverytime = myServices.sharedPreferences.getString("deliveryTime")!;
    getItems(categoryid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    getItems(catval);
    update();
  }

  @override
  getItems(categoryid) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsmodel": itemsModel
    });
  }

}