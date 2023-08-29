import 'package:user_app/core/class/statusrequest.dart';
import 'package:user_app/core/constant/routes.dart';
import 'package:user_app/core/functions/handingdatacontroller.dart';
import 'package:user_app/core/services/services.dart';
import 'package:user_app/data/datasource/remote/home_data.dart';
import 'package:user_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController{
  initialData();
  getData();
  goToItems(List categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();
  String? username, id, lang;
  String titleHomeCard = "", bodyHomeCard = "", deliveryTime = "";
  bool isSearch = false;
  HomeData homeData = HomeData(Get.find());


  List settings = [];
  List categories = [];
  List items = [];

  late StatusRequest statusRequest;
  TextEditingController? search;

  @override
  initialData(){
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settings.addAll(response['settings']['data']);
        titleHomeCard = settings[0]['settings_title'];
        bodyHomeCard = settings[0]['settings_body'];
        deliveryTime = settings[0]['settings_deliverytime'].toString();
        myServices.sharedPreferences.setString("deliveryTime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }


  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}


class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}